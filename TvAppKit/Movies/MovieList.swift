//
//  MovieList.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public struct MovieList: Identifiable {
    
    public let id: UUID
    public let title: String
    public let movies: [Movie]
}
