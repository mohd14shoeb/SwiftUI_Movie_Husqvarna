//
//  PosterImage.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 27/11/23.
//

import SwiftUI
import CachedAsyncImage

struct PosterImage: View {
    private let maxHeight: CGFloat
    private let maxWidth: CGFloat
    private let cornerRadius: CGFloat
    private let posterURL: String
    
    init(maxWidth: CGFloat, maxHeight: CGFloat, cornerRadius: CGFloat, posterURL: String) {
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.cornerRadius = cornerRadius
        self.posterURL = posterURL
    }
    var body: some View {
        ZStack {
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
                }
            )
        }
        .frame(maxWidth: maxWidth, maxHeight: maxHeight)
        .clipped()
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    PosterImage(maxWidth: .infinity, maxHeight: 350, cornerRadius: 10.0, posterURL: "")
}
