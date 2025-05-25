//
//  File.swift
//  NunitoCoreCache
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public protocol UsersStore {
    func retrieve() async throws -> [LocalUser]?
    func insert(_ users: [LocalUser])
    func insert(_ user: LocalUser) async throws
}
