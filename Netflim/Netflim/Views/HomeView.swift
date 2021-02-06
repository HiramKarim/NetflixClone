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
    @State private var topRowSelection: HomeTopRow = .home
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
                    
                    TopRowButtons(topRowSelection: $topRowSelection,
                                  homeGenre: $homeGenre,
                                  showGenreSelection: $showGenreSelection,
                                  showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: helper.moviesArray[0])
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
                    HomeStack(viewModel: viewModel,
                              topRowSelection: topRowSelection,
                              selectedGenre: homeGenre,
                              movieDetailToShow: $movieDetailToShow)
                }
            }
            // main VStack
            
            if let movieToShow = movieDetailToShow {
                MovieDetail(movie: movieToShow, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black
                        .opacity(0.9)
                    
                    VStack(spacing: 40) {
                        
                        Spacer()
                        
                        ForEach(HomeTopRow.allCases, id: \.self) {
                            topRow in
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                            }, label: {
                                
                                if topRow == topRowSelection {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .bold()
                                } else {
                                    Text("\(topRow.rawValue)")
                                        .foregroundColor(.gray)
                                }
                                
                            })
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
            }
            
            if showGenreSelection {
                Group {
                    Color.black
                        .opacity(0.9)

                    VStack(spacing: 40) {

                        Spacer()
                        
                        ForEach(viewModel.allGenres, id: \.self) {
                            genre in
                            
                            ScrollView(showsIndicators: false) {
                                
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                }, label: {

                                    if genre == homeGenre {
                                        Text("\(genre.rawValue)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                            .bold()
                                    } else {
                                        Text("\(genre.rawValue)")
                                            .foregroundColor(.gray)
                                    }

                                })
                                .padding(.bottom, 40)
                            }
                        }

                        Spacer()

                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        })
                        .padding(.bottom, 30)
                    }

                }
                .edgesIgnoringSafeArea(.all)
                .font(.title2)
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

enum HomeGenre: String, CaseIterable {
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
