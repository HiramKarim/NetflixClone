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
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // main VStack
            ScrollView(showsIndicators:false) {
                LazyVStack {
                    
                    TopRowButtons()
                    
                    TopMoviePreview(movie: helper.moviesArray[2])
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                    
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
                                    }
                                }
                            })
                        }
                    }
                    // movies and sections
                }
            }
            // main VStack
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
