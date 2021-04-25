//
//  SearchScreen.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit
import Combine

struct SearchScreen: View {
    
    init(movieService: MovieService = IoC.movieService) {
        self.movieService = movieService
    }
    
    private let movieService: MovieService
    
    @State private var query = ""
    @State private var lastQuery = ""
    @State private var list = MovieList.empty
    
    @State private var page = 1
    
    var body: some View {
        VStack {
            TextField("Search", text: $query)
            ScrollView {
                MovieGrid(list: list, paginationAction: loadNextPage)
            }
        }.onReceive(query.publisher, perform: { _ in search() })
    }
}

private extension SearchScreen {
    
    func search() {
        guard query != lastQuery else { return }
        lastQuery = query
        movieService.searchMovies(query: query, page: page) {
            switch $0 {
            case .failure: break // Handle
            case .success(let list): self.list = list
            }
        }
    }
    
    func loadNextPage() {
        page += 1
        movieService.searchMovies(query: query, page: page) {
            switch $0 {
            case .failure: break // Handle
            case .success(let list): self.list = .movies(self.list.movies + list.movies)
            }
        }
        
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
