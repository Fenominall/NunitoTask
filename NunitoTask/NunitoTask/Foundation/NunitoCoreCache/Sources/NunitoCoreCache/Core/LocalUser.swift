//
//  File.swift
//  NunitoCoreCache
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public struct LocalUser: Equatable, Sendable {
    public let id: UUID
    public let name: String
    public let position: String
    public let email: String
    public let phoneNumber: String
    public let userAvatar: URL?
    
    public init(
        id: UUID,
        name: String,
        position: String,
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
