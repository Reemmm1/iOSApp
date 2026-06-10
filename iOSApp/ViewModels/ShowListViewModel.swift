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
    enum State {
        case loading
        case loaded([TVShow])
        case error(String)
    }
    
    @Published private(set) var state: State = .loading
    
    private let service: APIService
    init(service: APIService) {
        self.service = service
    }
    
    func loadShows() async {
        state = .loading
        
        do {
            let shows = try await service.fetch(
                from: "https://api.tvmaze.com/shows",
                as: [TVShow].self
            )
            state = .loaded(shows)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
