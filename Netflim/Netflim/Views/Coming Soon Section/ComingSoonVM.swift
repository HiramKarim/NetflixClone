//
//  ComingZoonVM.swift
//  Netflim
//
//  Created by Hiram Castro on 17/02/21.
//

import Foundation

class ComingSoonVM: ObservableObject {
    
    @Published var movies: [MovieModel] = []
    
    init() {
        self.movies = generateMovies(20)
    }
    
}
