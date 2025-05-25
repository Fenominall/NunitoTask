//
//  File.swift
//  NunitoCoreDomain
//
//  Created by Fenominall on 5/25/25.
//

import Foundation

public enum Position: String, CaseIterable {
    case mobileDeveloper
    case frontendDeveloper
    case backendDeveloper
    case designer
    case qa
    
    public var displayName: String {
        switch self {
        case .mobileDeveloper: return "Mobile developer"
        case .frontendDeveloper: return "Frontent developer"
        case .backendDeveloper: return "Backend developer"
        case .designer: return "Designer"
        case .qa: return "QA"
        }
    }
}
