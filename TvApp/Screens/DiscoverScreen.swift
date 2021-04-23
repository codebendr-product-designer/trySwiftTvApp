//
//  DiscoverScreen.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit

struct DiscoverScreen: View {
    
    init(movieService: MovieService = IoC.movieService) {
        self.movieService = movieService
    }
    
    private let movieService: MovieService
    
    var body: some View {
        Text("Discover")
    }
}

struct DiscoverScreen_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverScreen()
    }
}
