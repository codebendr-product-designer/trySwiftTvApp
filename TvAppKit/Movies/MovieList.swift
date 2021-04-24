//
//  MovieList.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public struct MovieList: Identifiable {
    
    public let id: UUID
    public let title: String
    public let movies: [Movie]
}

public extension MovieList {
    
    static var empty: MovieList {
        let id = UUID()
        return MovieList(id: id, title: id.uuidString, movies: [])
    }
    
    static func movies(_ movies: [Movie]) -> MovieList {
        let id = UUID()
        return MovieList(id: id, title: id.uuidString, movies: movies)
    }
    
    static var preview: MovieList {
        let id = UUID()
        return MovieList(id: id, title: id.uuidString, movies: [
            .preview,
            .preview,
            .preview,
            .preview,
            .preview,
            .preview,
            .preview,
            .preview,
            .preview,
            .preview,
            .preview,
            .preview
        ])
    }
}
