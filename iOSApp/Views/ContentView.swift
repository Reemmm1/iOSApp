//
//  ContentView.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ShowListViewModel(service: TVMazeService())
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Loading Shows...")
            } else {
                Text("Loaded \(viewModel.shows.count) shows")
                
                NavigationStack {
                    List(viewModel.shows) {
                        show in NavigationLink {
                            ShowDetailView(show: show)
                        } label: {
                            ShowRowView(show: show)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadShows()
        }
    }
}
