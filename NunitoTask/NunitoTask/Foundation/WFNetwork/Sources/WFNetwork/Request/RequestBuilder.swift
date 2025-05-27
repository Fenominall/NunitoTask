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
        
        if let body = endpoint.body {
            switch body {
            case .data(let data):
                urlRequest.httpBody = data
                
            case .dictionary(let dictionary, let options):
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: dictionary, options: options)
                if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                }
                
            case .encodable(let encodable, let encoder):
                if let encoded = try? encoder.encodeAny(encodable) {
                    urlRequest.httpBody = encoded
                    if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    }
                }
            }
        }
        
        return urlRequest
    }
}

extension JSONEncoder {
    func encodeAny(_ value: Encodable) throws -> Data {
        let wrapped = _AnyEncodable(value)
        return try self.encode(wrapped)
    }
}

private struct _AnyEncodable: Encodable {
    let value: Encodable

    init(_ value: Encodable) {
        self.value = value
    }

    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
