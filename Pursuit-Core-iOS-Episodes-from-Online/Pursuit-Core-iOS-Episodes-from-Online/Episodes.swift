//
//  Episodes.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by David Lin on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Episodes: Decodable {
    let id: Int
    let name: String
    let season: Int
    let number: Int
    let image: Image?
}

struct Image: Decodable {
    let medium: String
    let original: String
}
