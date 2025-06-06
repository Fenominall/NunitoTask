//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public struct Position: Equatable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
