//
//  MovieListViewModel.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movieResponse: [Movie]?
    @Published var movieDetails: MovieDetails?
    @Published var errorFound: String?
    @Published var isLoadingShowing = false
    
    // MARK: Private properties
    private let networkManager: MovieServiceable
    
    // MARK: Initilizer
    init(networkManager: MovieServiceable) {
        self.networkManager = networkManager
    }
    
    func getErrorText() -> String {
        return self.errorFound ?? "No movie found"
    }
    
    // MARK: All API response
    func getMovieListResponse() {
        self.isLoadingShowing = true
        let movieApiName: MovieApiEndPoints = .getPopularMovieList
        self.networkManager.getMovieAPI(decodabel: MovieResponse.self, movieApi: movieApiName) { response, error in
            DispatchQueue.main.async {
                self.isLoadingShowing = false
                if error != nil {
                    self.errorFound = error
                } else {
                    self.movieResponse = response?.results
                }
            }
        }
//        self.getMacrosData(movieApiName: movieApiName, model: MovieResponse.self) { response, error in
//            if error != nil {
//                print(error)
//            } else {
//                print(response)
//                self.movieResponse = response
//            }
//        }
    }
    // MARK: All API response
    func getMovieDetails(movieID: Int) {
        self.isLoadingShowing = true
        let movieApiName: MovieApiEndPoints = .getMovieDetails(id: movieID)
        self.networkManager.getMovieAPI(decodabel: MovieDetails.self, movieApi: movieApiName) { response, error in
            DispatchQueue.main.async {
                self.isLoadingShowing = false
                if error != nil {
                    self.errorFound = error
                } else {
                    self.movieDetails = response
                }
            }
          
        }
    }
//    func getMacrosData<T: Decodable>(movieApiName: MovieApiEndPoints,
//                                     model: T.Type,
//                                     completion: @escaping (_ response: MovieResponse?,
//                                                            _ error: String?) -> Void) {
//        
//        self.networkManager.getMovieAPI(decodabel: MovieResponse.self, movieApi: movieApiName) { response, error in
//            DispatchQueue.main.async {
//                completion(response, error)
//            }
//        }
//    }
    
}
