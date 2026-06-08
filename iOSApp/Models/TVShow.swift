//
//  TVShow.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import Foundation

struct TVShow: Codable, Identifiable {
    let id: Int
    let name: String
    let summary: String?
    let image: ShowImage?
}

struct ShowImage: Codable {
    let medium: String?
    let original: String?
}

