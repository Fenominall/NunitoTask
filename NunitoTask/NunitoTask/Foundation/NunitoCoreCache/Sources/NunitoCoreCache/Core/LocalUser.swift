//
//  File.swift
//  NunitoCoreCache
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public struct LocalUser {
    public let id: UUID
    public let name: String
    public let position: String
    public let email: String
    public let phoneNumber: String
    public let userAvatar: Data?
    
    public init(
        id: UUID,
        name: String,
        position: String,
        email: String,
        phoneNumber: String,
        userAvatar: Data?
    ) {
        self.id = id
        self.name = name
        self.position = position
        self.email = email
        self.phoneNumber = phoneNumber
        self.userAvatar = userAvatar
    }
}
