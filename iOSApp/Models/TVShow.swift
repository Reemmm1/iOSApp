//
//  TVShow.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import Foundation

struct TVShow: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let summary: String?
    let image: ShowImage?
}

struct ShowImage: Codable, Hashable {
    let medium: String?
    let original: String?
}

extension TVShow {
    var cleanedSummary: String? {
        summary?
            .replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        ?? ""
    }
}

