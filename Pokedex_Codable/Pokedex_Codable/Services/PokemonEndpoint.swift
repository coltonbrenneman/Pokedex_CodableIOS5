//
//  PokemonEndpoint.swift
//  Pokedex_Codable
//
//  Created by Colton Brenneman on 6/28/23.
//

import Foundation

enum PokemonEndpoint {
    case pokedex(String)
    case pokemon(String, Int)
    
    var finalPokemonURL: URL? {
        guard let basePokemonURL = URL(string: "https://pokeapi.co") else { return nil }
        var pokemonURLRequest = URLRequest(url: basePokemonURL)
        
        switch self {
        case .pokedex(let pokedex):
            pokemonURLRequest.url?.append(path: "api/v2/\(pokedex)")
        case .pokemon(let pokedex, let pokemon):
            pokemonURLRequest.url?.append(path: "api/v2/\(pokedex)/\(pokemon)")
        }
        return pokemonURLRequest.url
    }
} // End of enum
// https://pokeapi.co/api/v2/pokemon/4
/*
 guard let baseURL = URL(string: baseURLString) else {return}
 var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
 urlComponents?.path = "/api/v2/pokemon/\(searchTerm.lowercased())"

 guard let finalURL = urlComponents?.url else {return}
 */
