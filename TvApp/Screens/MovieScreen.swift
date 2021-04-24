//
//  MovieScreen.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-23.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import TvAppKit

struct MovieScreen: View {
    
    init(
        movie: Movie,
        movieService: MovieService = IoC.movieService) {
        self.movieService = movieService
        _context = StateObject(wrappedValue: ScreenContext(movie: movie))
    }
    
    class ScreenContext: ObservableObject {
        
        init(movie: Movie) {
            self.movie = movie
        }
        
        @Published var movie: Movie
    }
    
    private var movie: Movie { context.movie }
    private let movieService: MovieService
    
    @StateObject private var context: ScreenContext
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            cover
            titleSection
            detailsSection
            buttonSection
        }
        .background(background)
        .onAppear(perform: fetchMovie)
    }
}

private extension MovieScreen {
    
    func fetchMovie() {
        context.movie = movie
        movieService.getMovie(id: movie.id) {
            switch $0 {
            case .failure: break // Handle error
            case .success(let movie): context.movie = movie
            }
        }
    }
    
    func toggleFavorite() {}
    
    func watchMovie() {}
}

private extension MovieScreen {
    
    var background: some View {
        MovieCover(movie: movie)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.2)
    }
    
    var buttonSection: some View {
        HStack {
            Button("Favorite", action: toggleFavorite)
            Button("Watch", action: watchMovie)
        }.padding(.top)
    }
    
    var cover: some View {
        MovieCover(movie: movie)
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: 500)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
    
    var titleSection: some View {
        Group {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(movie.title).font(.title)
                    Spacer()
                }
                HStack(spacing: 30) {
                    Text(movie.year)
                    Text(movie.runtime)
                    Text(movie.rated)
                        .fixedSize(horizontal: true, vertical: false)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .border(Color.white, width: 3)
                        .cornerRadius(5)
                }
                .padding(.bottom, 30)
                .font(.caption)
            }
        }
    }
    
    var detailsSection: some View {
        Group {
            Text(movie.plot)
            
            HStack(spacing: 0) {
                Text("Actors: ").bold()
                Text(movie.actors.joined(separator: ", "))
            }
            
            HStack(spacing: 0) {
                Text("Writers: ").bold()
                Text(movie.writers.joined(separator: ", "))
            }
        }
    }
}

struct MovieScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieScreen(movie: .preview)
    }
}
