//
//  Movie.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public struct Movie: Identifiable {
    
    public init(
        id: String,
        title: String,
        plot: String,
        
        year: String,
        runtime: String,
        rated: String,
        rating: String,
        
        actors: [String],
        writers: [String],
        genres: [String],
        
        posterUrl: String,
        videoUrl: URL?) {
        self.id = id
        self.title = title
        self.plot = plot
        
        self.year = year
        self.runtime = runtime
        self.rated = rated
        self.rating = rating
        
        self.actors = actors
        self.writers = writers
        self.genres = genres
     
        self.posterUrl = posterUrl
        self.videoUrl = videoUrl
    }
    
    public let id: String
    public let title: String
    public let plot: String
    
    public let year: String
    public let runtime: String
    public let rated: String
    public let rating: String
    
    public let actors: [String]
    public let writers: [String]
    public let genres: [String]
 
    public let posterUrl: String
    public let videoUrl: URL?
}

public extension Movie {
    
    static var preview: Movie {
        Movie(
            id: UUID().uuidString,
            title: "The Social Network",
            plot: "On a fall night in 2003, Harvard undergrad and computer programming genius Mark Zuckerberg sits down at his computer and heatedly begins working on a new idea. In a fury of blogging and programming, what begins in his dorm room soon becomes a global social network and a revolution in communication. A mere six years and 500 million friends later, Mark Zuckerberg is the youngest billionaire in history... but for this entrepreneur, success leads to both personal and legal complications.",
            year: "2010",
            runtime: "120 min",
            rated: "PG-13",
            rating: "7.7",
            actors: ["Jesse Eisenberg", "Rooney Mara", "Bryan Barter", "Dustin Fitzsimons"],
            writers: ["Aaron Sorkin (screenplay)", "Ben Mezrich (book)"],
            genres: ["Biography", "Drama"],
            posterUrl: "https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MzlmLTg4MGItZWJmMzBhZjE0Mjc1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
            videoUrl: URL(string: "https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MzlmLTg4MGItZWJmMzBhZjE0Mjc1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg")
        )
    }
}
