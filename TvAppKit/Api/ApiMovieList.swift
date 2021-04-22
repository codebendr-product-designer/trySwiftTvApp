//
//  ApiMovieList.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public struct ApiMovieList: ApiModel {
    
    public let movies: [ApiMovieListItem]
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
    
    public func convert() -> MovieList {
        MovieList(
            id: UUID(),
            title: "",  // Will be set by the service
            movies: movies.map { $0.convert() })
    }
}
