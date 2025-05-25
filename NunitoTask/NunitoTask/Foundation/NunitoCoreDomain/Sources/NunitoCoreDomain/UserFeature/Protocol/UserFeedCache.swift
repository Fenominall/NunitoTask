//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public protocol UserFeedCache {
    func save(_ feed: [User]) async throws
}
