//
//  PopularMovieSection.swift
//  Netflim
//
//  Created by Hiram Castro on 13/02/21.
//

import SwiftUI
import Kingfisher

struct PopularMovieSection: View {
    
    var movie: MovieModel
    
    @Binding var movieDetailToShow: MovieModel?
    
    var body: some View {
        
        GeometryReader { proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading, 3)
                
                Text(movie.name)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 20)
            }
            .foregroundColor(.white)
            .onTapGesture {
                self.movieDetailToShow = movie
            }
        }
        
    }
}

struct PopularMovieSection_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            PopularMovieSection(movie: helper.moviesArray[0], movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
        
    }
}
