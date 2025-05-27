//
//  CoreDataUserStore+UserStore.swift
//  NunitoTask
//
//  Created by Fenominall on 5/27/25.
//

import Foundation
import NunitoCoreCache

extension CoreDataUserStore: UsersStore {
    public func retrieve() async throws -> [LocalUser]? {
        try await performAsync { context in
            guard let cache = try ManagedCache.find(in: context) else {
                return nil
            }
            return cache.localFeed
        }
    }
    
    public func insert(_ users: [LocalUser]) async throws {
        try await performAsync { context in
            try ManagedCache.insert(users, in: context)
        }
    }
    
    public func insert(_ user: LocalUser) async throws {
        try await performAsync { context in
            try ManagedCache.insert([user], in: context)
        }
    }
}
