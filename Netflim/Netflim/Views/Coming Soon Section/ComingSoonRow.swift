//
//  ComingSoonRow.swift
//  Netflim
//
//  Created by Hiram Castro on 17/02/21.
//

import SwiftUI
import Kingfisher
import AVKit

struct ComingSoonRow: View {
    
    var movie:MovieModel
    
    @Binding var movieDetailToShow: MovieModel?
    
    let screen = UIScreen.main.bounds
    
    var player: AVPlayer {
        AVPlayer(url: URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!)
    }
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height: 200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 75)
                        .clipped()
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remaind me")
                        }
                    })
                    .padding(.horizontal)
                    
                    Button(action: {
                        movieDetailToShow = movie
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    })
                    .padding(.trailing, 24)
                }
            }
            .font(.caption)
            
            VStack(alignment: .leading) {
                Text(movie.name)
                    .font(.title2)
                    .bold()
                Text(movie.episodeDescriptionDisplay)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ComingSoonRow(movie: helper.moviesArray[1], movieDetailToShow: .constant(nil))
        }
    }
}
