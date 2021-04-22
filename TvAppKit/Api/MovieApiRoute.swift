//
//  MovieApiRoute.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public enum MovieApiRoute: ApiRoute {
    
    case movie(id: String)
    case moviesBySearch(query: String, page: Int)
    case moviesByYear(Int, page: Int)
    
    public var path: String { "" }
    
    public var queryParams: [String : String] {
        switch self {
        case .movie(let id): return ["i": id, "type": "movie", "plot": "full"]
        case .moviesBySearch(let query, let page): return ["s": query, "type": "movie", "page": "\(page)"]
        case .moviesByYear(let year, let page): return ["y": "\(year)", "type": "movie", "page": "\(page)"]
        }
    }
}
