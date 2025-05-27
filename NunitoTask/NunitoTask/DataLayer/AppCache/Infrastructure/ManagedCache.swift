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

// MARK: - Insertion
extension ManagedCache {
    static func insert(
        _ users: [LocalUser],
        in context: NSManagedObjectContext
    ) throws {
        let cache = try fetchOrCreateCache(in: context)
        let existingUsersByID = try ManagedUser.fetchExistingUsersByID(in: context)
        
        let newUsers = users.filter { existingUsersByID[$0.id] == nil }
        
        let managedUsers = ManagedUser.createBatch(from: newUsers, in: context, linkedTo: cache)
        
        let currentFeed = NSMutableOrderedSet(orderedSet: cache.feed)
        managedUsers.forEach { currentFeed.add($0) }
        cache.feed = currentFeed
        
        try context.save()
    }
}
