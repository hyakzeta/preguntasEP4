//
//  ContentView.swift
//  Pokedex
//
//  Created by alumno on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokemonViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.listPokemon, id: \.self) {pokemon in
                    Text(pokemon.name)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
