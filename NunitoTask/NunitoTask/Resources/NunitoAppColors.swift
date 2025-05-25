//
//  NunitoAppColors.swift
//  NunitoTask
//
//  Created by Fenominall on 5/25/25.
//

import SwiftUI

enum NunitoAppColors {
    case yellow
    case orange
    case red
    case cyan
    case pressed
    case disabled
    case background
    
    var color: Color {
        switch self {
        case .yellow:
            return Color(hex: "F4E041")
        case .orange:
            return Color(hex: "ffc700")
        case .red:
            return Color(hex: "CC3D41")
        case .cyan:
            return Color(hex: "00BDD3")
        case .pressed:
            return Color(hex: "FFC700")
        case .disabled:
            return Color(hex: "DEDEDE")
        case .background:
            return Color(hex: "FFFFFF")
        }
    }
}

extension Color {
    init(hex: String) {
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hex = hex.replacingOccurrences(of: "#", with: "")

        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

