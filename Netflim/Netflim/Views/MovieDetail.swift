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
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
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
                        
                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            
                        }
                        .padding(.horizontal, 10)
                        
                        CurrentEpisodeInformation(movie: movie)

                        CastInfo(movie: movie)
                        
                        HStack(spacing:60) {
                            SmallVerticalButton(text: "My List",
                                                isOnImage: "checkmark",
                                                isOffImage: "plus",
                                                isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Rate",
                                                isOnImage: "hand.thumbsup.fill",
                                                isOffImage: "hand.thumbsup",
                                                isOn: true) {
                                
                            }
                            
                            SmallVerticalButton(text: "Share",
                                                isOnImage: "square.and.arrow.up",
                                                isOffImage: "square.and.arrow.up",
                                                isOn: true) {
                                
                            }
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        //CustomTabSwitcher()
                        
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

struct CastInfo: View {
    var movie: MovieModel
    var body: some View {
        VStack(spacing:3) {
            HStack {
                Text(movie.getCastMembers)
                Spacer()
            }
            
            HStack {
                Text(movie.getCreatorsMembers)
                Spacer()
            }
            
        }
        .padding(.vertical, 5)
        .font(.caption)
        .foregroundColor(.gray)
    }
}

struct CurrentEpisodeInformation: View {
    var movie: MovieModel
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 5)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        MovieDetail(movie: helper.moviesArray[4])
    }
}
