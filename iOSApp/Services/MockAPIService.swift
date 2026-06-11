//
//  MockAPIService.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 11/6/2026.
//

import Foundation

final class MockAPIService: APIServiceProtocol {
    
    func fetch<T: Decodable>(
            from urlString: String,
            as type: T.Type
    ) async throws -> T {
        
        let mockShows = [
            TVShow(
                id: 1,
                name: "Mock Show",
                summary: "Mock Summary",
                image: nil
            )
        ]
        
        return mockShows as! T
    }
}
