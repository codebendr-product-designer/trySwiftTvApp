//
//  FavoriteMovieContext.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-24.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit

class FavoriteMovieContext: ObservableObject {
    
    init() {
        favorites = []
        favorites = persistedFavorites
    }
    
    @Published
    var favorites: [Movie] {
        didSet { persistedFavorites = favorites }
    }
    
    @UserDefaultsPersisted(key: "favorites", defaultValue: [])
    private var persistedFavorites: [Movie]
    
    
    func addFavorite(_ movie: Movie) {
        if isFavorite(movie) { return }
        favorites.append(movie)
    }
    
    func isFavorite(_ movie: Movie) -> Bool {
        favorites.contains(movie)
    }
    
    func removeFavorite(_ movie: Movie) {
        favorites = favorites.filter { $0.id != movie.id }
    }
    
    func toggleFavorite(_ movie: Movie) {
        isFavorite(movie) ? removeFavorite(movie) : addFavorite(movie)
    }
}
