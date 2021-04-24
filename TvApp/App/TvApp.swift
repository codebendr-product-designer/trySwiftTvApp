//
//  TvAppApp.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-22.
//

import SwiftUI
import TvAppKit

@main
struct TvApp: App {
    var body: some Scene {
        WindowGroup {
            AppTabs()
                .environmentObject(FavoriteMovieContext())
        }
    }
}
