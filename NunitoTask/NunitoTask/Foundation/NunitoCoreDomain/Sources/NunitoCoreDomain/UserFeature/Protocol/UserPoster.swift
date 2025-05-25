//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public protocol UserPoster {
    func post(user: User) async throws
}

