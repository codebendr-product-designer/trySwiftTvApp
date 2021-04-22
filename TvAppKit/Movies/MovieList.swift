//
//  MovieList.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//

import Foundation

public struct MovieList: Identifiable {
    
    /**
     In this simple example, the id is the title of the list.
     
     By using the title as the id, each title must be unique.
     */
    public var id: String { title }
    
    public let title: String
    public let movies: [Movie]
    public let page: Int
}
