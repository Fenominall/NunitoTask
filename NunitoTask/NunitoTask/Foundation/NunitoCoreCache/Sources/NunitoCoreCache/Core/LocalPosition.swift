//
//  File.swift
//  NunitoCoreCache
//
//  Created by Fenominall on 5/27/25.
//

import Foundation

public struct LocalPosition: Equatable, Sendable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
