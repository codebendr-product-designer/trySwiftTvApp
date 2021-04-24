//
//  MovieShelves.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit

struct MovieShelves: View {
    
    let lists: [MovieList]
    
    var body: some View {
        LazyVStack(spacing: 100) {
            ForEach(lists) { list in
                VStack {
                    Text(list.title).font(.headline)
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 20) {
                            ForEach(list.movies.map { MovieListItem(movie: $0) }) { item in
                                Button(action: { print("Hello") }) {
                                    Text(item.movie.title)
                                }.padding(40)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MovieShelves_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieShelves(lists: [
            .preview,
            .preview,
            .preview,
            .preview,
            .preview
        ])
    }
}
