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
    
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String
    
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
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
    
    var getCastMembers:String {
        return "Cast: \(cast)"
    }
    
    var getCreatorsMembers: String {
        return "Creators: \(creators)"
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
    
}
