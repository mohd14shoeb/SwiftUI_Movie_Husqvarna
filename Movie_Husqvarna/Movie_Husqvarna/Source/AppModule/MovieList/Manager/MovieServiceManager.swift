//
//  MovieServiceManager.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import Foundation


// MARK: enum Error
enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

// MARK: enum Result
enum Result<String> {
    case success
    case failure(String)
}

struct MovieServiceManager: MovieServiceable {

    // MARK: Private  Properties
    private let router = Router<MovieApiEndPoints>()

    // MARK: Genric get API
    func getMovieAPI<T>(decodabel: T.Type,
                   movieApi: MovieApiEndPoints,
                   completion: @escaping (T?, String?) -> Void) where T: Decodable {
        
        router.request(movieApi) { data, response, error in
            NetworkLogger.log(responseData: data, response: response, error: error)
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                        DispatchQueue.main.async {
                            completion(apiResponse, nil)
                        }
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            } else {
                completion(nil, error?.localizedDescription)
            }
        }
    }

    // MARK: Handle Network Response
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
