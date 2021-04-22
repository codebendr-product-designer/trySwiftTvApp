//
//  MovieListItem.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//

import Foundation

public struct MovieListItem {
    
    public init(movie: Movie) {
        self.id = UUID()
        self.movie = movie
    }
    
    public let id: UUID
    public let movie: Movie
}
