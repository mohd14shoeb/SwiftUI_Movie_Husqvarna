//
//  MovieListView.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieViewModel: MovieListViewModel
   
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                if let movieListArray = movieViewModel.movieResponse,
                   !movieListArray.isEmpty  {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            ForEach(movieListArray, id: \.self) { movie in
                                NavigationLink(destination: MovieDetailView(movie: movie,
                                                                            movieViewModel: self.movieViewModel)) {
                                    MovieItemView(posterURL: movie.posterURL)
                                }
                            }
                        }
                    }
                } else {
                    VStack {
                        if movieViewModel.isLoadingShowing {
                            ProgressCircleView()
                                .position(x: UIScreen.main.bounds.width/2,
                                          y: UIScreen.main.bounds.height/3)
                        } else {
                            Text(movieViewModel.getErrorText())
                            Button(action: {  movieViewModel.getMovieListResponse()}) {
                                Text("Retry Again")
                            }
                        }
                    }
                }
            }
            .task {
                movieViewModel.getMovieListResponse()
            }
            .navigationBarTitle("Popular Movie List", displayMode: .inline)
        }
        
    }
}

#Preview {
    MovieListView(movieViewModel: MovieListViewModel(networkManager: MovieServiceManager()))
}
