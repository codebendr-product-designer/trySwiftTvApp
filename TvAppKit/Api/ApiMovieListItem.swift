//
//  ApiMovieListItem.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public struct ApiMovieListItem: Identifiable, ApiModel {
    
    public let id: String
    public let title: String
    public let year: String
    public let posterUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case posterUrl = "Poster"
    }
    
    public func convert() -> Movie {
        Movie(
            id: id,
            title: title,
            plot: "",
            
            year: year,
            runtime: "",
            rated: "",
            rating: "",
            
            actors: [],
            writers: [],
            genres: [],
            
            posterUrl: posterUrl,
            videoUrl: nil)
    }
}

private extension String {
    
    func splitToArray() -> [String] {
        self.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
    }
}
