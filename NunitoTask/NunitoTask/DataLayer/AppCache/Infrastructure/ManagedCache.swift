//
//  ManagedCache.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//

import Foundation
import CoreData
import NunitoCoreCache

@objc(ManagedCache)
public class ManagedCache: NSManagedObject {
    @NSManaged public var feed: NSOrderedSet
}

// MARK: - Local Representation
extension ManagedCache {
    var localFeed: [LocalUser] {
        (feed.array as? [ManagedUser])?.compactMap { $0.local } ?? []
    }
}

// MARK: - Fetching Cache
extension ManagedCache {
    static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
        guard let entityName = entity().name else { return nil }
        let request = NSFetchRequest<ManagedCache>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        return try context.fetch(request).first
    }
    
    private static func fetchOrCreateCache(
        in context: NSManagedObjectContext
    ) throws -> ManagedCache {
        guard let oldCache = try ManagedCache.find(in: context) else {
            let newCache = ManagedCache(context: context)
            try context.save()
            return newCache
        }
        return oldCache
    }
}
