//
//  Pokemon.swift
//  Pokedex_Codable
//
//  Created by Karl Pfister on 2/7/22.
//

import Foundation

struct Pokemon: Decodable {
    let abilities: [AbilityDict]
    let moves: [MoveDict]
    let sprites: SpriteDict
    let id: Int
    let name: String
    let weight: Int
}

struct AbilityDict: Decodable {
    let ability: Ability
}

struct Ability: Decodable {
    let name: String
    let url: String
}

struct SpriteDict: Decodable {
    private enum CodingKeys: String, CodingKey {
        case frontShiny = "front_shiny"
    }
    let frontShiny: String
}

struct MoveDict: Decodable {
    let move: Move
}

struct Move: Decodable {
    let name: String
    let url: String
}
