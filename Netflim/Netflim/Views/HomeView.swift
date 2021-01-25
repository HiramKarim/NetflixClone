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
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // main VStack
            ScrollView(showsIndicators:false) {
                LazyVStack {
                    
                    TopMoviePreview(movie: MovieModel(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"]))
                        .frame(width: screen.width)
                        .padding(.top, -110)
                    
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
