//
//  ManagedUsser.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//

import Foundation
import CoreData
import NunitoCoreCache

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

extension ManagedUser {
    var local: LocalUser {
        return LocalUser(
            id: id,
            name: name,
            position: position,
            email: email,
            phoneNumber: phoneNumber,
            userAvatar: userAvatar
        )
    }
}

