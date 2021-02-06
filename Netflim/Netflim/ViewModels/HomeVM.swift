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
    
    var allGenres: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Horror, .Thriller]
    
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
    
    func getMovies(forCategory category: String, andHomeRow homerow: HomeTopRow, andGenre genre: HomeGenre) -> [MovieModel] {
        switch homerow {
        case .home:
            return movies[category] ?? []
        case .movies:
            return (movies[category] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[category] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .myList:
            return movies[category] ?? []
        }
    }
    
}
