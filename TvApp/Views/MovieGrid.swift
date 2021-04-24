//
//  MovieGrid.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-24.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit

struct MovieGrid: View {
    
    private let columns = [GridItem(.adaptive(minimum: 300))]
    
    let list: MovieList
    let paginationAction: () -> Void
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(list.movies) { movie in
                MovieNavigationButton(movie: movie)
                    .padding(.vertical)
                    .onAppear(perform: { tryPaginate(for: movie) })
            }
        }
    }
}

private extension MovieGrid {
    
    func tryPaginate(for movie: Movie) {
        guard movie.id == list.movies.last?.id else { return }
        paginationAction()
    }
}

struct MovieGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieGrid(list: .preview, paginationAction: {})
    }
}
