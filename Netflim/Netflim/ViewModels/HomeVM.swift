//
//  HomeVM.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import Foundation

class HomeVM: ObservableObject {
    
    let helper = Helper()
    
    @Published var movies: [String: [MovieModel]] = [:]
    
    var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Trending Now"] = helper.moviesArray.shuffled()
        movies["Stand-Up Comedy"] = helper.moviesArray.shuffled()
        movies["New Releases"] = helper.moviesArray.shuffled()
        movies["Watch It Again"] = helper.moviesArray.shuffled()
        movies["Sci-Fi"] = helper.moviesArray.shuffled()
    }
    
    func getMovies(forCategory category: String) -> [MovieModel] {
        return movies[category] ?? []
    }
    
}
