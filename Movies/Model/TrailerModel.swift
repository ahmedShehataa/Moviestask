//
//  TrailerModel.swift
//  Movies
//
//  Created by Shehata on 10/26/19.
//  Copyright © 2019 shehata. All rights reserved.
//

import Foundation

// MARK: - TrailerModel
struct TrailerModel: Codable {
    let id: Int
    let results: [TrailerResult]?
}

// MARK: - Result
struct TrailerResult: Codable {
    let id, iso639_1, iso3166_1, key: String
    let name, site: String
    let size: Int
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case key, name, site, size, type
    }
}
