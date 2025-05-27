//
//  ManagedPosition+CoreDataProperties.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//
//

import Foundation
import CoreData

@objc(ManagedPosition)
public class ManagedPosition: NSManagedObject {
    @NSManaged public var id: Int
    @NSManaged public var name: String?
    @NSManaged public var users: NSSet?
}

extension ManagedPosition {
    var userSet: Set<ManagedUser> {
        return users as? Set<ManagedUser> ?? []
    }
}
