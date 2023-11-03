//
//  PokemonData.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation

// MARK: - PokemonData
struct PokemonData: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
}
