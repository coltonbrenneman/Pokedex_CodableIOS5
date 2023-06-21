//
//  Pokedex.swift
//  Pokedex_Codable
//
//  Created by Colton Brenneman on 6/21/23.
//

import Foundation

//This will decode the lsit of Pokemon

struct PokedexTopLevel: Decodable {
    let next: String
    let results: [ResultDict]
}

struct ResultDict: Decodable {
    let name: String
    let url: String
}
