//
//  File.swift
//  WFNetwork
//
//  Created by Fenominall on 5/13/25.
//

import Foundation

public struct RequestBuilder: RequestBuildable {
    
    private let endpoint: Endpoint
    
    public init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    public func buildURLRequest(from endpoint: Endpoint) -> URLRequest? {
        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.params
        
        guard let url = components.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.allHTTPHeaderFields = endpoint.headers ?? [:]
        urlRequest.httpBody = endpoint.body
        return urlRequest
    }
}

extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}
