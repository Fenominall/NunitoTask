//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public protocol UserSaver {
    func save(user: User) async throws
}
