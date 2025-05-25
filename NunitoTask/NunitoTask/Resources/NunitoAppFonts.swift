//
//  NunitoAppFonts.swift
//  NunitoTask
//
//  Created by Fenominall on 5/25/25.
//

import Foundation
import SwiftUI

enum NunitoAppFonts: String {
    case regular = "NunitoSans-Regular"
    case bold = "NunitoSans-Bold"
    case semiBold = "NunitoSans-SemiBold"
    
    func swiftUIFont(size: CGFloat) -> Font {
        if UIFont(name: self.rawValue, size: size) != nil {
            return Font.custom(self.rawValue, size: size)
        } else {
            return Font.system(size: size)
        }
    }
}
