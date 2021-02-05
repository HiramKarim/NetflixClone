//
//  MoreLineThisView.swift
//  Netflim
//
//  Created by Hiram Castro on 27/01/21.
//

import SwiftUI

struct MoreLineThisView: View {
    
    var movies: [MovieModel]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<movies.count) { index in
                StandardHomeMovieView(movieModel: movies[index])
            }
        }
    }
}

struct MoreLineThisView_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        MoreLineThisView(movies: helper.moviesArray)
    }
}
