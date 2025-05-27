//
//  File.swift
//  NunitoCoreCache
//
//  Created by Fenominall on 5/25/25.
//

import Foundation
import NunitoCoreDomain

public final class LocalUserStore {
    private let store: UsersStore
    
    public init(store: UsersStore) {
        self.store = store
    }
}

// MARK: -  Retrieive
public extension LocalUserStore {
    func retrieve() async throws -> [User] {
        do {
            let users = try await store.retrieve()
            return users?.convertToModels() ?? []
        } catch {
            return []
        }
    }
}

// MARK: - Insert
extension LocalUserStore: UserFeedCache {
    public func save(_ feed: [User]) async throws {
        try await store.insert(feed.convertToLocale())
    }
}

extension LocalUserStore: UserSaver {
    public func save(user: User) async throws {
        try await store.insert(convertToLocale(user))
    }
    
    private func convertToLocale(_ user: User) -> LocalUser {
        LocalUser(
            id: user.id,
            name: user.name,
            position: user.position.rawValue,
            email: user.email,
            phoneNumber: user.phoneNumber,
            userAvatar: user.userAvatar
        )
    }
}

// MARK: - Helpers
public extension User {
    init?(localUser: LocalUser) {
        guard let position = Position(rawValue: localUser.position) else {
            return nil
        }
        
        self.init(
            id: localUser.id,
            name: localUser.name,
            position: position,
            email: localUser.email,
            phoneNumber: localUser.phoneNumber,
            userAvatar: localUser.userAvatar
        )
    }
}

extension Array where Element == LocalUser {
    func convertToModels() -> [User] {
        compactMap { User(localUser: $0) }
    }
}

public extension LocalUser {
    init?(user: User) {
        
        self.init(
            id: user.id,
            name: user.name,
            position: user.position.rawValue,
            email: user.email,
            phoneNumber: user.phoneNumber,
            userAvatar: user.userAvatar
        )
    }
}

extension Array where Element == User {
    func convertToLocale() -> [LocalUser] {
        compactMap { LocalUser(user: $0) }
    }
}
