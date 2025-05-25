//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public protocol FeedImageDataLoader {
    func load(from url: URL) async throws -> Data
}
