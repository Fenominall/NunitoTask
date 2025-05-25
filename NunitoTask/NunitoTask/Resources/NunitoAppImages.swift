//
//  NunitoAppImages.swift
//  NunitoTask
//
//  Created by Fenominall on 5/25/25.
//

import SwiftUI

enum NunitoAppImages {
    case success
    case failure
    case noWifi
    case cross
    case users
    case user
    case scatchyCat
    
    var image: UIImage? {
        switch self {
            
        case .success:
            return UIImage(named: "check")
        case .failure:
            return UIImage(named: "failure")
        case .noWifi:
            return UIImage(named: "noWifi")
        case .cross:
            return UIImage(named: "cross")
        case .users:
            return UIImage(named: "users")
        case .user:
            return UIImage(named: "user")
        case .scatchyCat:
            return UIImage(named: "sketchyCat")
        }
    }
}
