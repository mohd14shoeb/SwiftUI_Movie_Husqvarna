//
//  NetworkEnvironment.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import Foundation

// MARK: Enum Environment
enum APIEnvironment {
    case qaEnv
    case production
    case staging
}

struct NetworkEnvironment {

    // MARK: static properties
    static let environment: APIEnvironment = .qaEnv
    static var baseURL: String {
        switch environment {
        case .production: return "https://api.themoviedb.org/"
        case .qaEnv: return "https://api.themoviedb.org/"
        case .staging: return "https://api.themoviedb.org/"
        }
    }
}
