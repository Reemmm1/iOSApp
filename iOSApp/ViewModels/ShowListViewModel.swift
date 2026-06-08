//
//  ShowListViewModel.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import Foundation
import Combine

@MainActor
final class ShowListViewModel: ObservableObject {
    @Published var shows: [TVShow] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: TVMazeService
    init(service: TVMazeService) {
        self.service = service
    }
    
    func loadShows() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedShows = try await service.fetchShows()
            self.shows = fetchedShows
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
