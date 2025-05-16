//
//  NetworkManager.swift
//  Pokedex
//
//  Created by alumno on 13/11/23.
//

import Foundation

class NetworkManager {
    
    static  let shared  =   NetworkManager()
    static let url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        
    }
    
    func getListofPokemon(completed: @escaping (Result<[PokemonModel], TYPEerror>) -> Void)
        {
            //validate  url conexion
        guard let url =  URL(string: NetworkManager.url) else {
            completed(.failure(.invalidURL))
            return
        }
            //create    instance    URL
        URLSession.shared.dataTask(with: url) { data,response,error in
            //validate error
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
        
            //validate  data    and takeout null    spaces  making  extension   to  PokemonModel
            guard let data = data?.borrarData(removeString: "null,") else {
                completed(.failure(.decodingError))
                return
            }
            
            //Decode    data
            do  {
                //JSONDECODER
                let decodedResponse  =   try JSONDecoder().decode([PokemonModel].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                print("debug error  \(error.localizedDescription)")
                completed(.failure(.invalidResponse))
            }
            //call  task    to  show    results
        }.resume()
    }
}
