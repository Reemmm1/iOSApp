//
//  ShowListView.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import SwiftUI

struct ShowListView: View {
    @StateObject private var viewModel = ShowListViewModel(service: TVMazeService())
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Loading Shows...")
            } else {
                NavigationStack {
                    List(viewModel.shows) {
                        show in NavigationLink {
                            ShowDetailView(show: show)
                        } label: {
                            ShowRowView(show: show)
                        }
                    }
                    .navigationTitle("TV Shows")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .task {
            await viewModel.loadShows()
        }
    }
}
