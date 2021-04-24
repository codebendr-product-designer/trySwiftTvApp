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
        VStack(alignment: .leading) {
            Spacer()
            MovieCover(movie: movie)
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 500)
            HStack {
                Text(movie.title).font(.title)
                Spacer()
            }
            HStack(spacing: 30) {
                Text(movie.year)
                Text(movie.runtime)
                Text(movie.rated)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .border(Color.white, width: 3)
                    .cornerRadius(5)
            }
            .padding(.bottom, 40)
            .font(.caption)
            
            Text(movie.plot)
        }.background(
            MovieCover(movie: movie)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2)
        )
    }
}

struct MovieScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieScreen(movie: .preview)
    }
}
