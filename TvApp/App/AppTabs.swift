//
//  AppTabs.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-22.
//

import SwiftUI

struct AppTabs: View {
    
    enum Tab: String {
        
        case discover, favorites, search
    }
    
    @State private var selection: Tab = .discover
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                DiscoverScreen().tabItem {
                    Text("Discover")
                }.tag(Tab.discover)
                
                FavoritesScreen().tabItem {
                    Text("Favorites")
                }.tag(Tab.favorites)
                
                SearchScreen().tabItem {
                    Text("Search")
                }.tag(Tab.search)
            }
        }
    }
}

struct AppTabs_Previews: PreviewProvider {
    static var previews: some View {
        AppTabs()
    }
}
