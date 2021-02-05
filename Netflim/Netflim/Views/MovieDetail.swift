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
    
    @Binding var movieDetailToShow: MovieModel?
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            movieDetailToShow = nil
                        }, label: {
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
                            
                            CustomTabSwitcher(tabs: [.episodes, .trailers, .more],
                                              movie: movie,
                                              showSeasonPicker: $showSeasonPicker,
                                              selectedSeason: $selectedSeason)
                            
                        }
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                //front of all
                if showSeasonPicker {
                    
                    //black layer
                    Group {
                        Color.black.opacity(0.9)
                        
                        VStack {
                            
                            Spacer()
                            
                            ForEach(0..<(movie.numberOfSeassons ?? 0)) {
                                season in
                                
                                Button(action: {
                                    self.selectedSeason = (season + 1)
                                    self.showSeasonPicker = false
                                }, label: {
                                    Text("Season \((season + 1))")
                                        .foregroundColor(selectedSeason == (season + 1) ? .white : .gray)
                                        .bold()
                                        .font(selectedSeason == (season + 1) ? .title : .title2)
                                })
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                self.showSeasonPicker = false
                            }, label: {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                    .scaleEffect(x: 1.1)
                            })
                            .padding(.bottom, 30)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    //black layer
                    
                } else {
                    
                }
                
            }
            
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
        MovieDetail(movie: helper.moviesArray[0], movieDetailToShow: .constant(nil))
    }
}
