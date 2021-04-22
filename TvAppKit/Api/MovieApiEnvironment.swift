//
//  MovieApiEnvironment.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public struct MovieApiEnvironment: ApiEnvironment {
    
    public init() {
        let urlString = "http://www.omdbapi.com"
        guard let url = URL(string: urlString) else { fatalError("Invalid URL") }
        self.url = url
    }
    
    public let url: URL
}
