//
//  ShowsAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowsAPIClient {
    
    // need to string interpolate String into URL to find show in search
    static func getShows(userSearch: String, completion: @escaping (Result<[AllTVShows], AppError>) -> ()) {
        let showEndpointURLSting = "https://api.tvmaze.com/search/shows?q=\(userSearch)"

        NetworkHelper.shared.performDataTask(with: showEndpointURLSting) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success( let data):
                do{
                    let shows = try JSONDecoder().decode([AllTVShows].self, from: data)
                    completion(.success(shows))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
