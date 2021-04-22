//
//  Movie.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public struct Movie: Identifiable {
    
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
