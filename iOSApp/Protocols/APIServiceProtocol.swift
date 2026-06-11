//
//  APIServiceProtocol.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 11/6/2026.
//

import Foundation

protocol APIServiceProtocol {
    
    func fetch<T: Decodable>(
        from urlString: String,
        as type: T.Type
    ) async throws -> T
}
