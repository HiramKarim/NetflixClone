//
//  Helper.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import Foundation

class Helper {
    
    let moviesArray: [MovieModel] = [
        MovieModel(id: UUID().uuidString,
                   name: "DARK",
                   thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeassons: 1, promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Travelers",
                   thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeassons: 2, promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Community",
                   thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeassons: 3, promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Alone",
                   thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeassons: 4, promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Hannibal",
                   thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeassons: 5, promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "After Life",
                   thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"], year: 2020, rating: "TV-MA", numberOfSeassons: 6, promotionHeadline: "Watch Season 6 now")
    ]
    
}
