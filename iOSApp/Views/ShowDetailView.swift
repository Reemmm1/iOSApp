//
//  ShowDetailView.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import SwiftUI

struct ShowDetailView: View {
    let show: TVShow
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let imageUrl = show.image?.original {
                    let url = URL(string: imageUrl)
                    
                    AsyncImage(url: url) {
                        image in image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                if let summary = show.cleanedSummary {
                    Text(summary)
                }
            }
            .padding()
        }
        .navigationTitle(show.name)
    }
}
