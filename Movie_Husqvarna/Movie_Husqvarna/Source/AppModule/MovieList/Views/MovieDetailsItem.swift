//
//  MovieDetailsItem.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 26/11/23.
//

import SwiftUI

struct MovieDetailsItem: View {
   private let movie: MovieDetails
    
    init(movie: MovieDetails) {
        self.movie = movie
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
                    Text(movie.genreText)
                    Text(movie.durationText)
                HStack {
                    Text("Release year:")
                    Text(movie.yearText)
                }
            })
            
            Spacer()
            VStack(alignment: .leading, content: {
                HStack(alignment: .top, content: {
                    Text("Rating:").bold()
                    Text(movie.scoreText).bold()
                })
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                HStack {
                    Text("Language:")
                    Text(movie.spokenLanguages?.first?.name ?? "")
                }
            })
        }
        Divider()
        Text("Story:").bold()
        Text(movie.overview ?? "")
        Spacer(minLength: 4)
    }
}

#Preview {
    MovieDetailsItem(movie: MovieDetails.stubbedMoviesDetails)
}
