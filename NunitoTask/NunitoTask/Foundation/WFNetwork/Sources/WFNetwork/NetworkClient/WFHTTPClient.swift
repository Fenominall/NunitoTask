//
//  File.swift
//  WFNetwork
//
//  Created by Fenominall on 5/24/25.
//

import Foundation

public protocol WFHTTPClient {
    func sendReqeust<T: Decodable>(
        endpoint: Endpoint,
        responseModelType: T.Type
    ) async throws -> T
}
