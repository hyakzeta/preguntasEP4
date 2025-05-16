//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by alumno on 13/11/23.
//

import Foundation

class PokemonViewModel :ObservableObject {
        @Published var listPokemon = [PokemonModel]()
        @Published var filtrarPokemon = [PokemonModel]()
    
   init() {
        getListPokemon()
    }
    
    func getListPokemon(){
        NetworkManager.shared.getListofPokemon { result in
            DispatchQueue.main.async {
                switch result {
                case.success(let listPokemon):
                    print("Pokemon: \(listPokemon.count)")
                    self.listPokemon = listPokemon
                    self.filtrarPokemon = listPokemon
                case.failure(let error):
                    print("error \(error.localizedDescription)")
                }
            }
        }
    }
}
