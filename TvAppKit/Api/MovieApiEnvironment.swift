//
//  MovieApiEnvironment.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public enum MovieApiEnvironment: ApiEnvironment {
    
    case production(apiKey: String)
    
    public var apiKey: String {
        switch self {
        case .production(let apiKey): return apiKey
        }
    }
    
    public var url: URL {
        switch self {
        case .production: return URL(string: "http://www.omdbapi.com")!
        }
    }
}
