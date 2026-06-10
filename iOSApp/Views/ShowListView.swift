//
//  ShowListView.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import SwiftUI

struct ShowListView: View {
    @StateObject private var viewModel = ShowListViewModel(service: APIService())
    
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView("Loading Shows...")
            case .loaded(let shows):
                NavigationStack(path: $coordinator.path) {
                    List(shows) {
                        show in
                        Button {
                            coordinator.showDetail(for: show)
                        } label: {
                            ShowRowView(show: show)
                        }
                    }
                    .navigationTitle("TV Shows")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: Route.self) {
                        route in switch route {
                        case .showDetail(let show):
                            ShowDetailView(show: show)
                        }
                    }
                }
            case .error(let message):
                Text(message)
            }
        }.task {
            await viewModel.loadShows()
        }
    }
}
