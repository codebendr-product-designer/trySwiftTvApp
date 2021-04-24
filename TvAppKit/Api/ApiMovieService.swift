//
//  ApiMovieService.swift
//  TvAppKit
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftKit

public class ApiMovieService: ApiService, MovieService {
    
    public init(
        env: MovieApiEnvironment,
        session: URLSession = .shared) {
        self.environment = env
        self.movieEnvironment = env
        self.session = session
    }
    
    public let environment: ApiEnvironment
    public let session: URLSession
    
    private let movieEnvironment: MovieApiEnvironment
    
    public func getMovie(id: String, completion: @escaping (MovieResult<Movie>) -> Void) {
        let route = MovieApiRoute.movie(id: id, env: movieEnvironment)
        let request = route.request(for: environment)
        performTask(with: request, type: ApiMovie.self, completion: completion)
    }
    
    public func getMovies(year: Int, page: Int, completion: @escaping (MovieResult<MovieList>) -> Void) {
        let route = MovieApiRoute.moviesByYear(year, query: "movie", page: page, env: movieEnvironment)
        let request = route.request(for: environment)
        performTask(with: request, type: ApiMovieList.self) {
            switch $0 {
            case .failure: completion($0)
            case .success(let list):
                let movies = list.movies.distinct()
                let list = MovieList(id: list.id, title: "\(year)", movies: movies)
                completion(.success(list))
            }
        }
    }
    
    public func searchMovies(query: String, page: Int, completion: @escaping (MovieResult<MovieList>) -> Void) {
        let query = query.trimmingCharacters(in: .whitespaces)
        let route = MovieApiRoute.moviesBySearch(query: query, page: page, env: movieEnvironment)
        let request = route.request(for: environment)
        performTask(with: request, type: ApiMovieList.self) {
            switch $0 {
            case .failure: completion($0)
            case .success(let list):
                let movies = list.movies.distinct()
                let list = MovieList(id: list.id, title: query, movies: movies)
                completion(.success(list))
            }
        }
    }
}
