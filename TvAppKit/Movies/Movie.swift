//
//  Movie.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//

import Foundation

public struct Movie: Identifiable {
    
    public let id: String
    public let title: String
    public let plot: String
    
    public let year: Int
    public let runtime: String
    public let rated: String
    public let rating: Double
    
    public let actors: [String]
    public let writers: [String]
    public let genres: [String]
 
    public let posterUrl: String
    public let videoUrl: String
}
