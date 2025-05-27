//
//  ManagedUsser.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//

import Foundation
import CoreData

@objc(ManagedUser)
public class ManagedUser: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var position: String
    @NSManaged public var email: String
    @NSManaged public var phoneNumber: String
    @NSManaged public var userAvatar: URL?
    @NSManaged public var cache: ManagedCache
}
