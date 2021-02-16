//
//  SearchView.swift
//  Netflim
//
//  Created by Hiram Castro on 09/02/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchVM()
    
    @State private var searchText = ""
    
    @State private var movieDetailToShow: MovieModel? = nil
    
    var body: some View {
        
        let searchTextBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchTest(with: $0)
        }
        
        return ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: searchTextBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your search did not have any results.")
                            .bold()
                            .padding(.top, 150)
                    } else if vm.viewState == .ready && !vm.isShowingPopularMovies {
                        
                        VStack {
                            HStack {
                                Text("Movies & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading, 12)
                                Spacer()
                            }
                            
                            
                            SearchResultsGrid(movies: vm.searchResult, movieDetailToShow: $movieDetailToShow)
                            
                        }
                        
                    }
                }
                
                
                Spacer()
            }
            
            if let movieToShow = movieDetailToShow {
                MovieDetail(movie: movieToShow, movieDetailToShow: $movieDetailToShow)
            }
            
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {
    
    var movies: [MovieModel]
    @Binding var movieDetailToShow: MovieModel?
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Searches")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
                Spacer()
            }
            LazyVStack {
                ForEach(movies, id: \.id) { movie in
                    PopularMovieSection(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 75)
                }
            }
        }
    }
}
