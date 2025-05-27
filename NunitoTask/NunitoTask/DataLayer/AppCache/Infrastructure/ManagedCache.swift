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
