//
//  Model.swift
//  w3-hw3
//
//  Created by Cagla Efendioglu on 8.10.2022.
//

import Foundation

// MARK: - SearchResult

struct SearchResult: Codable {
    let resultCount: Int?
    let results: [Search]?
}

// MARK: - Result

struct Search: Codable {
    let wrapperType: String?
    let trackName: String?
    let formattedPrice: String?
    let trackPrice: Double?
    let shortDescription, longDescription: String?
    let resultDescription: String?
    let artworkUrl600: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType
        case trackName
        case formattedPrice, trackPrice
        case shortDescription, longDescription
        case resultDescription = "description"
        case artworkUrl600
        case artworkUrl30, artworkUrl60, artworkUrl100
    }
}
