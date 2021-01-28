//
//  TrailerList.swift
//  Netflim
//
//  Created by Hiram Castro on 27/01/21.
//

import SwiftUI

struct TrailerList: View {
    
    var trailers: [TrailerModel]
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(trailers) { trailer in
                VStack {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(width: screen.width)
                    
                    Text(trailer.name)
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding(.bottom, 10)
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            TrailerList(trailers: helper.exampleTrailers)
        }
    }
}
