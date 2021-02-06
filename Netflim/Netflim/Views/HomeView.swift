//
//  HomeView.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import SwiftUI

struct HomeView: View {
    
    var viewModel = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    let helper = Helper()
    
    @State private var movieDetailToShow: MovieModel?
    @State private var topRowSelectiom: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // main VStack
            ScrollView(showsIndicators:false) {
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelectiom,
                                  homeGenre: $homeGenre,
                                  showGenreSelection: $showGenreSelection,
                                  showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: helper.moviesArray[2])
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    HomeStack(viewModel: viewModel, topRowSelection: topRowSelectiom, movieDetailToShow: $movieDetailToShow)
                }
            }
            // main VStack
            
            if let movieToShow = movieDetailToShow {
                MovieDetail(movie: movieToShow, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            } else {
                
            }
            
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case AllGenres
    case Action
    case Comedy
    case Horror
    case Thriller
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
