//
//  MovieDetail.swift
//  Netflim
//
//  Created by Hiram Castro on 24/01/21.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: MovieModel
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width:30, height:30)
                    })
                }
                .padding(.horizontal, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                        StandardHomeMovieView(movieModel: movie)
                            .frame(width:screen.width / 2.5)
                        
                        MovieInfoSubheadline(movie: movie)
                        
                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        }
                        
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            
        }
        
    }
}

struct MovieInfoSubheadline: View {
    var movie: MovieModel
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            
            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    
    var rating:String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
            
        }
        .frame(width: 50, height: 20)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        MovieDetail(movie: helper.moviesArray[4])
    }
}
