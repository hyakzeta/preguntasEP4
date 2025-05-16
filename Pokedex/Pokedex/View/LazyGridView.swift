//
//  LazyGridView.swift
//  Pokedex
//
//  Created by alumno on 13/11/23.
//

import SwiftUI

struct LazyGridView: View {
    @State var nColumns = [GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible()) ]
    var body: some View {
        LazyVGrid(columns: nColumns , content: {
            ForEach(nnumeros, id:\.self) (numero in
                                          Circle()
                .overlay(
                Text("\(numero)")
                    .foregroundColor(.white))
            ))
        }
}

struct LazyGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridView()
    }
}
