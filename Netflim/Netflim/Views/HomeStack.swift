//
//  HomeStack.swift
//  Netflim
//
//  Created by Hiram Castro on 05/02/21.
//

import SwiftUI

struct HomeStack: View {
    
    var viewModel = HomeVM()
    
    var topRowSelection: HomeTopRow
    var selectedGenre: HomeGenre
    
    @Binding var movieDetailToShow: MovieModel?
    
    var body: some View {
        // movies and sections
        ForEach(viewModel.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .foregroundColor(.white)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(viewModel.getMovies(forCategory: category,
                                                    andHomeRow: topRowSelection,
                                                    andGenre: selectedGenre)) { movie in
                            StandardHomeMovieView(movieModel: movie)
                                .frame(width: 135, height: 200)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                })
            }
            .padding(.leading, 6)
        }
        // movies and sections
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStack(viewModel: HomeVM(),
                          topRowSelection: .home,
                          selectedGenre: .AllGenres,
                          movieDetailToShow: .constant(nil))
            }
        }
    }
}
