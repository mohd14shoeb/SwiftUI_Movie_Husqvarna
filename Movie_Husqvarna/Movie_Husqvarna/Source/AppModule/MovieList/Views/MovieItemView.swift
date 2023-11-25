//
//  MovieItemView.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import SwiftUI
import CachedAsyncImage

struct MovieItemView: View {
    private let posterURL: String
    
    init(posterURL: String) {
        self.posterURL = posterURL
    }
    var body: some View {
        VStack {
            CachedAsyncImage(
                url: self.posterURL,
                placeholder: {
                    ZStack {
                        Color.gray.opacity(0.03)
                        ProgressView()
                    }
                },
                image: {
                    Image(uiImage: $0)
                        .resizable()
                        .scaledToFill()
                    
                }
            )
        }
        .frame(width: UIScreen.main.bounds.size.width - 20, height: 550)
        .clipped()
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    MovieItemView(posterURL: "https://image.tmdb.org/t/p/w500/bkpPTZUdq31UGDovmszsg2CchiI.jpg")
}
