//
//  SearchResults.swift
//  Netflim
//
//  Created by Hiram Castro on 15/02/21.
//

import SwiftUI

struct SearchResultsGrid: View {
    
    var movies:[MovieModel]
    @Binding var movieDetailToShow: MovieModel?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(movies, id: \.id) { movie in
                StandardHomeMovieView(movieModel: movie)
                    .frame(height: 50)
                    .onTapGesture {
                        movieDetailToShow = movie
                    }
            }
        }
        
    }
}

struct SearchResultsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsGrid(movies: generateMovies(20), movieDetailToShow: .constant(nil))
    }
}
