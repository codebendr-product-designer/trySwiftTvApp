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
    
    @State private var year = 0
    @State private var lists = [MovieList]()
    
    var body: some View {
        VStack {
            MovieShelves2(lists: lists, paginationAction: loadNextYear)
            Button("Next year", action: loadNextYear)
        }
        .edgesIgnoringSafeArea(.horizontal)
        .onAppear(perform: loadFirstYear)
    }
}

private extension DiscoverScreen {
    
    func loadFirstYear() {
        year = 2021
        lists = []
        loadYear()
    }
    
    func loadNextYear() {
        year -= 1
        loadYear()
    }
    
    func loadYear() {
        movieService.getMovies(year: year, page: 1) {
            switch $0 {
            case .failure: break // Handle error
            case .success(let list): self.lists.append(list)
            }
        }
    }
}

struct DiscoverScreen_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverScreen()
    }
}
