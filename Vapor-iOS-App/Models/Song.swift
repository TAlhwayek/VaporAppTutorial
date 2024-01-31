//
//  Song.swift
//  Vapor-iOS-App
//
//  Created by Tony Alhwayek on 1/30/24.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
