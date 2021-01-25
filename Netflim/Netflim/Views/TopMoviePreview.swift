//
//  TopMoviePreview.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    var movie: MovieModel
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(movie.categories, id: \.self) {
                        category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            if !isLastCategory(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List",
                                        isOnImage: "checkmark",
                                        isOffImage: "plus",
                                        isOn: true) {
                        
                    }
                    
                    Spacer()
                    
                    WhiteButton(text: "play", imageName: "play.fill") {
                        
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info",
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        isOn: true) {
                        
                    }
                    Spacer()
                }
                
            }
            .background(
                LinearGradient.blackOpacityGradiente
                    .padding(.top, 250)
            )
        }
        .foregroundColor(.white)
    }
    
    func isLastCategory(_ category: String) -> Bool {
        let categoryCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: category) {
            if index + 1 != categoryCount {
                return false
            }
        }
        
        return true
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: MovieModel(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"]))
    }
}
