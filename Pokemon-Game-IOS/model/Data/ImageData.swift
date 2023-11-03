//
//  ImageData.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation

// MARK: - ImageData
struct ImageData: Codable {
    let sprites: Sprites
}


// MARK: - Sprites
class Sprites: Codable {
    let other: Other?

    init( other: Other?){
        self.other = other
    }
}


// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}


// MARK: - Other
struct Other: Codable {
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}




