//
//  MovieDetails+Stub.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 27/11/23.
//

import Foundation

extension MovieDetails {
    
    static var stubbedMoviesDetails: MovieDetails {
        let response: MovieDetails? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!
    }
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}
