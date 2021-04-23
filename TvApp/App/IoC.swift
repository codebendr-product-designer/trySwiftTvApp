//
//  IoC.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import TvAppKit

final class IoC {
    
    private init() {}
    
    static var movieService: MovieService = ApiMovieService(
        env: .production(apiKey: ""))
}
