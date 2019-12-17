//
//  EpisodesAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/17/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct EpisodesAPIClient {
    static func getEpisodes( id: Int, completion: @escaping (Result<[Episodes], AppError>) -> ()) {
        let endpointURL = "http://api.tvmaze.com/shows/\(id)/episodes"
        
        NetworkHelper.shared.performDataTask(with: endpointURL) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
                    let episodes = try JSONDecoder().decode([Episodes].self, from: data)
                    completion(.success(episodes))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
