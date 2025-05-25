//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public protocol FeedImageDataCache {
    func cache(_ data: Data, for url: URL) async throws
}
