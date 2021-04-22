//
//  MovieApiRoute.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public enum MovieApiRoute: ApiRoute {
    
    case movie(id: String, env: MovieApiEnvironment)
    case moviesBySearch(query: String, page: Int, env: MovieApiEnvironment)
    case moviesByYear(Int, page: Int, env: MovieApiEnvironment)
    
    public var path: String { "" }
    
    public var queryParams: [String : String] {
        switch self {
        case .movie(let id, let env): return ["i": id, "type": "movie", "plot": "full", "apikey": env.apiKey]
        case .moviesBySearch(let query, let page, let env): return ["s": query, "type": "movie", "page": "\(page)", "apikey": env.apiKey]
        case .moviesByYear(let year, let page, let env): return ["y": "\(year)", "type": "movie", "page": "\(page)", "apikey": env.apiKey]
        }
    }
}
