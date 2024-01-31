//
//  ModalType.swift
//  Vapor-iOS-App
//
//  Created by Tony Alhwayek on 1/30/24.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update(Song)
}
