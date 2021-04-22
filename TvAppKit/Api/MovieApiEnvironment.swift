//
//  MovieApiEnvironment.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public struct MovieApiEnvironment: ApiEnvironment {
    
    public init(apiKey: String) {
        let urlString = "http://www.omdbapi.com"
        guard let url = URL(string: urlString) else { fatalError("Invalid URL") }
        self.apiKey = apiKey
        self.url = url
    }
    
    public let apiKey: String
    public let url: URL
}
