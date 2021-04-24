//
//  FavoritesScreen.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct FavoritesScreen: View {
    
    @EnvironmentObject private var favoriteContext: FavoriteMovieContext
    
    var body: some View {
        ScrollView(.vertical) {
            MovieGrid(
                list: .movies(favoriteContext.favorites),
                paginationAction: {})
        }
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
