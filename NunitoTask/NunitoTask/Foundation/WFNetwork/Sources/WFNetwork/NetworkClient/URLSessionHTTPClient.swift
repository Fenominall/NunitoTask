//
//  File.swift
//  WFNetwork
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public final class URLSessionHTTPClient {
    // MARK: - Properties
    private let session: URLSession
    private let requestBuildable: RequestBuildable
    
    // MARK: - Lifecycle
    public init(
        session: URLSession,
        requestBuildable: RequestBuildable
    ) {
        self.session = session
        self.requestBuildable = requestBuildable
    }
}

// MARK: - Send Request
extension URLSessionHTTPClient: WFHTTPClient {
    public func sendReqeust<T: Decodable>(
        endpoint: Endpoint,
        responseModelType: T.Type
    ) async throws -> T {
        guard let request = requestBuildable.buildURLRequest(from: endpoint) else {
            throw RequestError.badRequest
        }
        
        let (data, response) = try await session.data(for: request)
        
        _ = try validateResponse(response)
        
        return try decodeData(responseModelType, from: data)
    }
}

// MARK: - Helpers
extension URLSessionHTTPClient {
    private func validateResponse(_ response: URLResponse) throws -> HTTPURLResponse {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw RequestError(fromHttpStatusCode: httpResponse.statusCode)
        }
        
        return httpResponse
    }
    
    private func decodeData<T: Decodable>(_ type: T.Type,
                                          from data: Data) throws -> T {
        let decoder = JSONDecoder()
        
        do {
            let decodedType = try decoder.decode(type, from: data)
            return decodedType
        } catch let error {
            throw RequestError.decodingError(error.localizedDescription)
        }
    }
}
