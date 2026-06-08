//
//  TVMazeService.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import Foundation

final class TVMazeService {
    
    func fetchShows() async throws -> [TVShow] {
        guard let url = URL(string: "https://api.tvmaze.com/shows") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        print(response)
        
        let shows  = try JSONDecoder().decode(
            [TVShow].self,
            from: data
        )
        
        return shows
    }
    
}
