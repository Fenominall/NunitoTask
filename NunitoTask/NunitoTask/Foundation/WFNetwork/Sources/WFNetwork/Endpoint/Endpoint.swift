//
//  File.swift
//  WFNetwork
//
//  Created by Fenominall on 5/13/25.
//

import Foundation

public typealias Header = [String: String]

public enum BodyParameter {
    case data(Data)
    case dictionary([String: Any], options: JSONSerialization.WritingOptions = [])
    case encodable(Encodable, encoder: JSONEncoder = .init())
}

public protocol Endpoint {
    var method: RequestMethod { get }
    var headers: Header? { get }
    var scheme: Scheme { get }
    var host: String { get }
    var path: String { get }
    var body: BodyParameter? { get }
    var params: [URLQueryItem]? { get }
}
