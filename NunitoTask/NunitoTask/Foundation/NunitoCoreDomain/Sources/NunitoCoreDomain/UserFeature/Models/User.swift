//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public struct User {
    public let id: UUID
    public let name: String
    public let position: Position
    public let email: String
    public let phoneNumber: String
    public let userAvatar: URL?
    
    public init(
        id: UUID,
        name: String,
        position: Position,
        email: String,
        phoneNumber: String,
        userAvatar: URL?
    ) {
        self.id = id
        self.name = name
        self.position = position
        self.email = email
        self.phoneNumber = phoneNumber
        self.userAvatar = userAvatar
    }
}
