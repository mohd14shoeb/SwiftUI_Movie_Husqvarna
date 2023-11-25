//
//  MovieApiEndPoints.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import Foundation

// MARK: Enum EndPoints
public enum MovieApiEndPoints {
    case getPopularMovieList
    case getMovieDetails(id: Int)
    case none
}

// MARK: Enum Extension
extension MovieApiEndPoints: EndPointType {

    // MARK: properties
    var environmentBaseURL: String {
        return String(NetworkEnvironment.baseURL)
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    var path: String {
        switch self {
        case .getMovieDetails(let id):
            return "3/movie/\(id)?language=\(SecratKey.language)"
        case .getPopularMovieList:
            return "3/movie/popular?api_key=\(SecratKey.api_key)"
        default: return ""
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getMovieDetails, .getPopularMovieList:
            return .get
        default: return .delete
        }
    }

    var task: HTTPTask {
        switch self {
        case .getMovieDetails, .getPopularMovieList:
            return .request
        default: return .request
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .getMovieDetails, .getPopularMovieList:
            return ["Authorization" : SecratKey.Authorization]
        case .none:
            return nil
        }
    }

}

