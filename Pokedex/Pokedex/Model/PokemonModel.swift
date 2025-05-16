//
//  PokemonModel.swift
//  Pokedex
//
//  Created by alumno on 13/11/23.
//

import Foundation
struct PokemonModel : Decodable , Hashable {
    
    let id : Int
    let name: String
    let attack :Int
    let defense:Int
    let description:String
    let imageUrl:String
    let type:String
    
    static let pokemon = PokemonModel(id: 130,
                                      name: "gyarados",
                                      attack: 125,
                                      defense: 79,
                                      description: "Rarely seen in the wild. Huge and vicious,is capable of destroying entire cities in a rage.",
                                      imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2FCEF1D6F5-9D30-4310-A7BC-96EABAB3972A?alt=media&token=239e5462-8b1d-42af-b733-b4dfcd4686ac",
                                      type: "flying")
    
}

enum TYPEerror : Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
    
}

extension Data {
    func borrarData(removeString word:  String) ->  Data?   {
        let dataAsString    =   String(data:self,encoding: .utf8)
        let borrarDataString    =   dataAsString?.replacingOccurrences(of: word, with: "")
        guard   let data =  borrarDataString?.data(using: .utf8)    else    {return nil}
        return data
    }
}
