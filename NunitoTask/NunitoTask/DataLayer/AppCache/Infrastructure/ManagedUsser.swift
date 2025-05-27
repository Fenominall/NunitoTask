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
    @NSManaged public var id: Int
    @NSManaged public var name: String
    @NSManaged public var position: ManagedPosition
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
            position: LocalPosition(
                id: Int(position.id),
                name: position.name ?? ""
            ),
            email: email,
            phoneNumber: phoneNumber,
            userAvatar: userAvatar
        )
    }
}

// MARK: - Fetching users
extension ManagedUser {
    static func fetchExistingUsersByID(in context: NSManagedObjectContext) throws -> [Int: ManagedUser] {
        guard let entityName = entity().name else { return [:] }
        let request = NSFetchRequest<ManagedUser>(entityName: entityName)
        request.returnsObjectsAsFaults = false
        let users = try context.fetch(request)
        
        return users.reduce(into: [Int: ManagedUser]()) { result, user in
            result[user.id] = user
        }
    }
}

// MARK: - Inserting Cache
extension ManagedUser {
    static func createBatch(
        from localUsers: [LocalUser],
        in context: NSManagedObjectContext,
        linkedTo cache: ManagedCache
    ) -> [ManagedUser] {
        localUsers.map { local in
            let user = ManagedUser(context: context)
            user.id = local.id
            user.name = local.name
            user.email = local.email
            user.phoneNumber = local.phoneNumber
            
            let position = ManagedPosition(context: context)
            position.id = local.position.id
            position.name = local.name
            
            user.position = position
            user.userAvatar = local.userAvatar
            user.cache = cache
            return user
        }
    }
}
