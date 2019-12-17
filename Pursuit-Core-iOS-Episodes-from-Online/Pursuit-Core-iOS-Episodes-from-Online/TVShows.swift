//
//  TVShows.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct AllTVShows: Decodable {
    let show: Shows
}

struct Shows: Decodable {
    let id: Int
    let name: String
    let rating: Rating?
    let image: Image?
}

struct Rating: Decodable {
    let average: Double?
}

struct ShowImage: Decodable {
    let medium: String
    let original: String
}
