//
//  MovieModel.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import Foundation

struct MovieModel: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
}
