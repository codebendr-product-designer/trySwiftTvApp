//
//  MovieService.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol MovieService {
    
    func getMovie(id: String, completion: @escaping (MovieResult<Movie>) -> Void)
    func getMovies(year: Int, page: Int, completion: @escaping (MovieResult<[Movie]>) -> Void)
    func searchMovies(query: String, page: Int, completion: @escaping (MovieResult<[Movie]>) -> Void)
}
