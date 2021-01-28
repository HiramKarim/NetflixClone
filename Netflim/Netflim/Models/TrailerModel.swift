//
//  TrailerModel.swift
//  Netflim
//
//  Created by Hiram Castro on 27/01/21.
//

import Foundation

struct TrailerModel: Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
    
}
