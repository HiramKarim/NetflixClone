//
//  Helper.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import Foundation

class Helper {
    
    let exampleEpisodeInfo = CurrentEpisodeInfo(episodeName: "Beginnings and Endings",
                                                description: "Six month after the dissapearences, the police form a task foce. In 2052, Jonas Learns that most of Winden perished in an apocalyptic event.",
                                                season: 2,
                                                episode: 1)
    
    lazy var moviesArray: [MovieModel] = [
        MovieModel(id: UUID().uuidString,
                   name: "DARK",
                   thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020,
                   rating: "TV-MA",
                   numberOfSeassons: 1,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Travelers",
                   thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020,
                   rating: "TV-MA",
                   numberOfSeassons: 2,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Community",
                   thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020, rating: "TV-MA",
                   numberOfSeassons: 3,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Alone",
                   thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020, rating: "TV-MA",
                   numberOfSeassons: 4,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "Hannibal",
                   thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020,
                   rating: "TV-MA",
                   numberOfSeassons: 5,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   promotionHeadline: "New episodes coming soon"),
        MovieModel(id: UUID().uuidString,
                   name: "After Life",
                   thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020,
                   rating: "TV-MA",
                   numberOfSeassons: 6,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   promotionHeadline: "Watch Season 6 now")
    ]
    
}
