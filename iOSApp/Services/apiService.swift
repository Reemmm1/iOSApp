//
//  apiService.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 9/6/2026.
//

import Foundation

final class APIService: APIServiceProtocol {
    
    func fetch<T: Decodable>(
        from urlString: String,
        as type: T.Type,
    ) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        print(response)
        
        return try JSONDecoder().decode(type, from: data)
    }
}
