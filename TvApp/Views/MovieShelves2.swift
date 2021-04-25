//
//  MovieShelves2.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-25.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit
import TvAppKit

struct MovieShelves2: View {
    
    let lists: [MovieList]
    let paginationAction: () -> Void
    
    typealias Row = CollectionViewRow<Int, Movie>
    
    var rows: [Row] {
        lists.enumerated().map {
            Row(section: $0.offset, items: $0.element.movies)
        }
    }
    
    var body: some View {
        CollectionView(
            rows: rows,
            layout: layout,
            cell: cell,
            supplementaryView: sectionTitle)
    }
}

private extension MovieShelves2 {
    
    var layout: CollectionViewLayout {
        .shelves(
            itemSize: CGSize(width: 250, height: 370),
            headerHeight: 50,
            sectionInsets: NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 40, trailing: 0),
            itemSpacing: 0)
    }
    
    func cell(for indexPath: IndexPath, movie: Movie) -> some View {
        MovieNavigationButton(movie: movie)
            .onAppear(perform: { })
    }
    
    @ViewBuilder
    func sectionTitle(for indexPath: IndexPath) -> some View {
        let index = indexPath.section
        if lists.count > index {
            Text(lists[index].title).font(.title)
        } else { EmptyView() }
    }
}

struct MovieShelves2_Previews: PreviewProvider {
    static var previews: some View {
        MovieShelves(lists: [
            .preview,
            .preview,
            .preview,
            .preview,
            .preview
        ], paginationAction: {})
    }
}
