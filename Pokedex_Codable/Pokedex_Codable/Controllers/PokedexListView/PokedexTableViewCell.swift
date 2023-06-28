//
//  PokedexTableViewCell.swift
//  Pokedex_Codable
//
//  Created by Colton Brenneman on 6/21/23.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    
    // MARK: - Properties
    var pokemon: Pokemon?
    var pokemonSprite: UIImage?
    
    // MARK: - Functions
    func updateViews(pokemonResult: ResultDict) {
        NetworkingController.fetchPokemon(with: pokemonResult.name) { [weak self] result in
            switch result {
            case .success(let pokemon):
                self?.pokemon = pokemon
                self?.fetchPokemonImage(pokemon: pokemon)
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
    }
    
    func fetchPokemonImage(pokemon: Pokemon) {
        NetworkingController.fetchImage(for: pokemon) { [weak self] result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.pokemonSprite = image
                    self?.pokemonImageView.image = image
                    self?.pokemonIDLabel.text = "#\(pokemon.id)"
                    self?.pokemonNameLabel.text = pokemon.name
                }
            case .failure(let failure):
                print(failure.errorDescription!)
            }
        }
    }
} //End of class
