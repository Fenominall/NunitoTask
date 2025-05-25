//
//  File.swift
//  WFNetwork
//
//  Created by Fenominall on 5/13/25.
//

import Foundation

public typealias Header = [String: String]
public typealias Body = Data

public protocol Endpoint {
    var method: RequestMethod { get }
    var headers: Header? { get }
    var scheme: Scheme { get }
    var host: String { get }
    var path: String { get }
    var body: Body? { get }
    var params: [URLQueryItem]? { get }
}
