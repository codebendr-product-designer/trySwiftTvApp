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
    
    @State private var text = ""
    @State private var lastQuery = ""
    @State private var list = MovieList.empty
    
    var body: some View {
        VStack {
            TextField("Search", text: $text)
            ScrollView {
                MovieGrid(list: list)
            }
        }.onReceive(text.publisher, perform: { _ in search() })
    }
}

private extension SearchScreen {
    
    func search() {
        guard text != lastQuery else { return }
        lastQuery = text
        movieService.searchMovies(query: text, page: 1) {
            switch $0 {
            case .failure: break // Handle
            case .success(let list): self.list = list
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
