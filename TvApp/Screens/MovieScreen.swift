//
//  MovieScreen.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit

struct MovieScreen: View {
    
    init(
        movie: Movie,
        movieService: MovieService = IoC.movieService) {
        self.movie = movie
        self.movieService = movieService
    }
    
    private let movie: Movie
    private let movieService: MovieService
    
    var body: some View {
        Text(movie.title)
    }
}

struct MovieScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieScreen(movie: .preview)
    }
}
