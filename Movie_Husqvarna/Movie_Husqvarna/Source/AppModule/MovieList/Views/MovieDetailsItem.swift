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
            })
        }
        Divider()
        Text("Story:").bold()
        Text(movie.overview ?? "")
        Spacer(minLength: 4)
    }
}

//#Preview {
//    MovieDetailsItem(movie: MovieDetails(adult: <#T##Bool#>, backdropPath: <#T##String?#>, belongsToCollection: <#T##BelongsToCollection?#>, budget: <#T##Int?#>, genres: <#T##[Genre]?#>, homepage: <#T##String?#>, id: <#T##Int?#>, imdbID: <#T##String?#>, originalLanguage: <#T##String?#>, originalTitle: <#T##String?#>, overview: <#T##String?#>, popularity: <#T##Double?#>, posterPath: <#T##String?#>, productionCompanies: <#T##[ProductionCompany]?#>, productionCountries: <#T##[ProductionCountry]?#>, releaseDate: <#T##String?#>, revenue: <#T##Int?#>, runtime: <#T##Int?#>, spokenLanguages: <#T##[SpokenLanguage]?#>, status: <#T##String?#>, tagline: <#T##String?#>, title: <#T##String?#>, video: <#T##Bool?#>, voteAverage: <#T##Double?#>, voteCount: <#T##Int?#>))
//}
