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
    let paginationAction: () -> Void
    
    var body: some View {
        LazyVStack(spacing: 40) {
            ForEach(lists) { list in
                listView(for: list)
                    .onAppear { tryPaginate(for: list) }
            }
        }
    }
}

private extension MovieShelves {
    
    func listView(for list: MovieList) -> some View {
        VStack {
            Text(list.title).font(.headline)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    ForEach(list.movies) { movie in
                        MovieNavigationButton(movie: movie)
                            .padding(40)
                    }
                }
            }
        }
    }
    
    func tryPaginate(for list: MovieList) {
        guard list.id == lists.last?.id else { return }
        paginationAction()
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
        ], paginationAction: {})
    }
}
