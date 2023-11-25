//
//  MovieServiceable.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import Foundation

// MARK: protocol MacrosServiceable
protocol MovieServiceable {
    func getMovieAPI<T: Decodable>(decodabel: T.Type,
                              movieApi: MovieApiEndPoints,
                              completion: @escaping (_ response: T?,
                                                    _ error: String?) -> Void)
}
