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
        VStack {
            CachedAsyncImage(
                url: movieViewModel.movieDetails?.posterURL ?? "",
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
        }.padding(.all, -20 )
        .frame(width: 320, height: 320)
    }
    
    func getPrintdata() {
        print(movie.posterURL)
    }
}

#Preview {
    MovieDetailView(movie: Movie(adult: false, backdropPath: "", genreIDS: [], id: 0, originalTitle: "", overview: "", popularity: 0.0, posterPath: "", releaseDate: "", title: "", video: false, voteAverage: 0.0, voteCount: 0), movieViewModel: MovieListViewModel(networkManager: MovieServiceManager()))
}
