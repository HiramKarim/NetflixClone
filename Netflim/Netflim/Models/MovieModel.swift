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
    
    // MovieDetail View
    
    var year: Int
    var rating: String
    var numberOfSeassons: Int?
    
    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let seasons = numberOfSeassons {
            if seasons == 1 {
                return "1 season"
            } else {
                return "\(seasons) seasons"
            }
        }
        
        return ""
    }
}
