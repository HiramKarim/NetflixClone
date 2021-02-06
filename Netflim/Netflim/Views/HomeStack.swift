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
                        ForEach(viewModel.getMovies(forCategory: category)) { movie in
                            StandardHomeMovieView(movieModel: movie)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                })
            }
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
                HomeStack(viewModel: HomeVM(), topRowSelection: .movies, movieDetailToShow: .constant(nil))
            }
        }
    }
}
