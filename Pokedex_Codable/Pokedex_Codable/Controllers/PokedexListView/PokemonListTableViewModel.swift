//
//  PokemonListTableViewModel.swift
//  Pokedex_Codable
//
//  Created by Colton Brenneman on 6/28/23.
//

import Foundation

protocol PokemonListTableViewModelDelegate: PokedexTableViewController {
    func pokedexLoadedSuccessfully()
}

class PokemonListTableViewModel {
    
    // MARK: - Properties
    var pokedex: PokedexTopLevel?
    var results: [ResultDict] {
        self.pokedex?.results ?? []
    }
    weak var delegate: PokemonListTableViewModelDelegate?
    private let networkProvider: NetworkingController
    
    init(injectedDelegate: PokemonListTableViewModelDelegate, networkProvider: NetworkingController = NetworkingController()) {
        self.delegate = injectedDelegate
        self.networkProvider = networkProvider
    }
    
    // MARK: - Functions
    func fetchPokedex() {
        NetworkingController.fetchPokedex { [weak self] result in
            switch result {
            case .success(let pokedex):
                self?.pokedex = pokedex
                self?.delegate?.pokedexLoadedSuccessfully()
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
    }
    
} // End of struct
