//
//  PokedexTableViewController.swift
//  Pokedex_Codable
//
//  Created by Colton Brenneman on 6/21/23.
//

import UIKit

class PokedexTableViewController: UITableViewController {

    // MARK: - Properties
    var viewModel: PokemonListTableViewModel!
//    var pokedex: PokedexTopLevel?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetch the pokedex
        viewModel = PokemonListTableViewModel(injectedDelegate: self)
        viewModel.fetchPokedex()
//        NetworkingController.fetchPokedex { [weak self] result in
//            switch result {
//            case .success(let pokedex):
//                DispatchQueue.main.async {
//                    self?.pokedex = pokedex
//                    self?.tableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.errorDescription!)
//            }
//        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokedex?.results.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokedexCell", for: indexPath) as? PokedexTableViewCell else { return UITableViewCell() }
        
        guard let pokedex = viewModel.pokedex else { return UITableViewCell() }
        let resultsDict = pokedex.results[indexPath.row]
        cell.updateViews(pokemonResult: resultsDict)
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  segue.identifier == "toDetailVC",
              let destination = segue.destination as? PokemonViewController,
              let indexPath = tableView.indexPathForSelectedRow,
               let cell = tableView.cellForRow(at: indexPath) as? PokedexTableViewCell else { return }
        
        destination.pokemon = cell.pokemon
        destination.pokemonSprite = cell.pokemonSprite
    }
} //End of class

// MARK: - Extension
extension PokedexTableViewController: PokemonListTableViewModelDelegate {
    func pokedexLoadedSuccessfully() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
