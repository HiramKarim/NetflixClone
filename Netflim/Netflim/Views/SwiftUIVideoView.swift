//
//  SwiftUIVideoView.swift
//  Netflim
//
//  Created by Hiram Castro on 27/01/21.
//

import SwiftUI
import AVKit

struct SwiftUIVideoView: View {
    var url:URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SwiftUIVideoView_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        SwiftUIVideoView(url: helper.exampleVideoURL)
    }
}
