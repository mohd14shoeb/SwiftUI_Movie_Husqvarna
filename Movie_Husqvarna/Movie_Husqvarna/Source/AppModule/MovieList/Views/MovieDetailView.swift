//
//  MovieDetailView.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import SwiftUI
import CachedAsyncImage

struct MovieDetailView: View {
    private let movie: Movie
    @ObservedObject var movieViewModel: MovieListViewModel
    
    init(movie: Movie, movieViewModel: MovieListViewModel) {
        self.movie = movie
        self.movieViewModel = movieViewModel
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some View {
            List {
                if let movieDetails = movieViewModel.movieDetails {
                    posterImage
                    MovieDetailsItem(movie: movieDetails)
                        .listRowSeparator(.hidden)
                }
               
            }
            .navigationBarTitle(movie.movieTitle, displayMode: .inline)
            .task {
                self.movieViewModel.getMovieDetails(movieID: self.movie.id)
            }
            
        
    }
    
    private var posterImage: some View {
        PosterImage(maxWidth: .infinity, maxHeight: 350, 
                    cornerRadius: 10.0, posterURL: movieViewModel.movieDetails?.posterURL ?? "")
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    
    func getPrintdata() {
        print(movie.posterURL)
    }
}

#Preview {
    MovieDetailView(movie: Movie(adult: false, backdropPath: "", genreIDS: [], 
                                 id: 0, originalTitle: "", overview: "", popularity: 0.0,
                                 posterPath: "", releaseDate: "", title: "", video: false,
                                 voteAverage: 0.0, voteCount: 0), movieViewModel: MovieListViewModel(networkManager: MovieServiceManager()))
}

