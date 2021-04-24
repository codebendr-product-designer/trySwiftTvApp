//
//  MovieNavigationButton.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-24.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit

struct MovieNavigationButton: View {
    
    let movie: Movie
    
    @State private var size: CGSize = .zero
    
    var body: some View {
        NavigationLink(destination: MovieScreen(movie: movie)) {
            MovieListItem(movie: movie)
                .frame(width: 250, height: 370)
        }.buttonStyle(CardButtonStyle())
    }
}

struct MovieNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        MovieNavigationButton(movie: .preview)
    }
}
