//
//  MovieListItem.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-24.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit
import Kingfisher

struct MovieListItem: View {
    
    let movie: Movie
    
    var body: some View {
        MovieCover(movie: movie)
            .cornerRadius(20)
    }
}

struct MovieListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieListItem(movie: .preview)
    }
}
