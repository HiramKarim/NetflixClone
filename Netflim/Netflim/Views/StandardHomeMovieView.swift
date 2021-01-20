//
//  StandardHomeMovieView.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovieView: View {
    
    var movieModel: MovieModel
    
    var body: some View {
        KFImage(movieModel.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct StandardHomeMovieView_Previews: PreviewProvider {
    static var previews: some View {
        
        let helper = Helper()
        StandardHomeMovieView(movieModel: helper.moviesArray[0])
        
    }
}
