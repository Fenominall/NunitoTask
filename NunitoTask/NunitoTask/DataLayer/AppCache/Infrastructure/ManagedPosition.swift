//
//  ManagedPosition.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//

import Foundation
import CoreData

@objc(MangedPosition)
public class MangedPosition: NSManagedObject {
    @NSManaged public var id: Int
    @NSManaged public var name: String
    @NSManaged public var users: NSSet?
}

extension ManagedPosition {
    var userSet: Set<ManagedUser> {
        return users as? Set<ManagedUser> ?? []
    }
}
