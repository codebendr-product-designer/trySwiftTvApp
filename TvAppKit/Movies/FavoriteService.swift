//
//  FavoriteService.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol FavoriteService {
    
    func addFavoriteMovie(movie: Movie, completion: @escaping () -> Void)
    func getFavoriteMovies(page: Int, completion: @escaping (MovieResult<[Movie]>) -> Void)
    func removeFavoriteMovie(movie: Movie, completion: @escaping () -> Void)
}

