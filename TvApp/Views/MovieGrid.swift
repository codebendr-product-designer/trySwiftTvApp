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
    
    let columns = [GridItem(.adaptive(minimum: 300))]
    
    let list: MovieList
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(list.movies) { movie in
                MovieNavigationButton(movie: movie)
            }
        }
    }
}

struct MovieGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieGrid(list: .preview)
    }
}
