//
//  ApiMovie.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public struct ApiMovie: Identifiable, ApiModel {
    
    public let id: String
    public let title: String
    public let plot: String
    
    public let year: String
    public let runtime: String
    public let rated: String
    public let rating: String
    
    public let actors: String
    public let writers: String
    public let genres: String
 
    public let posterUrl: String
    
    /**
     Since this API doesn't have a video URL, we will inject
     a static one for all movies.
     */
    public static var videoUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case plot = "Plot"
        
        case year = "Year"
        case runtime = "Runtime"
        case rated = "Rated"
        case rating = "imdbRating"
        
        case actors = "Actors"
        case writers = "Writer"
        case genres = "Genre"
        
        case posterUrl = "Poster"
    }
    
    public func convert() -> Movie {
        Movie(
            id: id,
            title: title,
            plot: plot,
            
            year: year,
            runtime: runtime,
            rated: rated,
            rating: rating,
            
            actors: actors.splitToArray(),
            writers: writers.splitToArray(),
            genres: genres.splitToArray(),
            
            posterUrl: posterUrl,
            videoUrl: Self.videoUrl)
    }
}

private extension String {
    
    func splitToArray() -> [String] {
        self.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
    }
}
