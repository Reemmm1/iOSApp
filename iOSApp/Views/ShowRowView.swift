//
//  ShowRowView.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 8/6/2026.
//

import SwiftUI

struct ShowRowView: View {
    let show: TVShow
    
    var body: some View {
        HStack(spacing: 12) {
            
            if let imageUrl = show.image?.medium,
               let url = URL(string: imageUrl) {
                
                AsyncImage(url: url) {
                    image in image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 90)
                .clipped()
            }
            
            Text(show.name)
                .font(.headline)
        }
    }
}

//#Preview {
//    ShowRowView()
//}
