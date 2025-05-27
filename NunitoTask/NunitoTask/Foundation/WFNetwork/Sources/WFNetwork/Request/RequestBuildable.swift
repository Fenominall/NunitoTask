//
//  File.swift
//  WFNetwork
//
//  Created by Fenominall on 5/13/25.
//

import Foundation

public protocol RequestBuildable {
    func buildURLRequest(from endpoint: Endpoint) -> URLRequest?
}

