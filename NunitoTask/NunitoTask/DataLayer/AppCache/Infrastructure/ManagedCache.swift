//
//  ManagedCache.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//

import Foundation
import CoreData

@objc(ManagedCache)
public class ManagedCache: NSManagedObject {
    @NSManaged public var feed: NSOrderedSet
}
