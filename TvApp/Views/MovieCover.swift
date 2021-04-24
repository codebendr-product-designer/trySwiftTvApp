//
//  MovieCover.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-24.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit
import Kingfisher

struct MovieCover: View {
    
    let movie: Movie
    
    var body: some View {
        KFImage(URL(string: movie.posterUrl))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct MovieCover_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieCover(movie: .preview)
    }
}
