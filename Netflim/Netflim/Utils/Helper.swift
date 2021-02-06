//
//  Helper.swift
//  Netflim
//
//  Created by Hiram Castro on 19/01/21.
//

import Foundation

class Helper {
    
    let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!
    let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
    let exampleImageURL2 = URL(string: "https://picsum.photos/300/104")!
    let exampleImageURL3 = URL(string: "https://picsum.photos/300/104")!
    
    var randomExampleImageURL: URL {
        return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL3
    }
    
    lazy var exampleTrailer1 = TrailerModel(name: "Season 3 Trailer",
                                       videoURL: exampleVideoURL,
                                       thumbnailImageURL: exampleImageURL)
    
    lazy var exampleTrailer2 = TrailerModel(name: "The Hero's Journey",
                                       videoURL: exampleVideoURL,
                                       thumbnailImageURL: exampleImageURL2)
    
    lazy var exampleTrailer3 = TrailerModel(name: "The Mysterious",
                                       videoURL: exampleVideoURL,
                                       thumbnailImageURL: exampleImageURL3)
    
    lazy var exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]
    
    let exampleEpisodeInfo = CurrentEpisodeInfo(episodeName: "Beginnings and Endings",
                                                description: "Six month after the dissapearences, the police form a task foce. In 2052, Jonas Learns that most of Winden perished in an apocalyptic event.",
                                                season: 2,
                                                episode: 1)
    
    lazy var episode1 = Episode(name: "Beginnings and Endings",
                                season: 1,
                                episodeNumber: 1,
                                thumbnailImageURLString: "https://picsum.photos/300/102",
                                description: "Six months after the disappearences, the police from a task force. In 2052, Jonas learns that most of Winden perished an apocalyptic event",
                                length: 53,
                                videoURL: exampleVideoURL)
    
    lazy var episode2 = Episode(name: "Dark Matter",
                                season: 1,
                                episodeNumber: 2,
                                thumbnailImageURLString: "https://picsum.photos/300/103",
                                description: "Clausen and charlotee interview Regina. The Stranger takes Hanna to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
                                length: 54,
                                videoURL: exampleVideoURL)
    
    lazy var episode3 = Episode(name: "Ghosts",
                                season: 1,
                                episodeNumber: 3,
                                thumbnailImageURLString: "https://picsum.photos/300/104",
                                description: "In 1954, a missing Helge returns, but he'll only speak to noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
                                length: 56,
                                videoURL: exampleVideoURL)
    
    lazy var allEpisodes = [episode1, episode2, episode3]
    
    lazy var movieLikeThisArray:[MovieModel] = [
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
                   moreLikeThisMovies: [],
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
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
                   moreLikeThisMovies: [],
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
        MovieModel(id: UUID().uuidString,
                   name: "Community",
                   thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020, rating: "TV-MA",
                   numberOfSeassons: 3,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   moreLikeThisMovies: [],
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
        MovieModel(id: UUID().uuidString,
                   name: "Alone",
                   thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020, rating: "TV-MA",
                   numberOfSeassons: 4,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   moreLikeThisMovies: [],
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
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
                   moreLikeThisMovies: [],
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
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
                   moreLikeThisMovies: [],
                   promotionHeadline: "Watch Season 6 now",
                   trailers: exampleTrailers)
    ].shuffled()
    
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
                   moreLikeThisMovies: movieLikeThisArray,
                   episodes: allEpisodes,
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
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
                   moreLikeThisMovies: movieLikeThisArray,
                   episodes: allEpisodes,
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
        MovieModel(id: UUID().uuidString,
                   name: "Community",
                   thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020, rating: "TV-MA",
                   numberOfSeassons: 3,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   moreLikeThisMovies: movieLikeThisArray,
                   episodes: allEpisodes,
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
        MovieModel(id: UUID().uuidString,
                   name: "Alone",
                   thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                   categories: ["Dystopian", "Horror", "Suspensefull", "Sci-Fi TV"],
                   year: 2020, rating: "TV-MA",
                   numberOfSeassons: 4,
                   defaultEpisodeInfo: exampleEpisodeInfo,
                   creators:"Baran bo Odan, Jantje Friese",
                   cast:"Louis Hofmann, Oliver Masucci, Jordis Triebel",
                   moreLikeThisMovies: movieLikeThisArray,
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
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
                   moreLikeThisMovies: movieLikeThisArray,
                   promotionHeadline: "New episodes coming soon",
                   trailers: exampleTrailers),
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
                   moreLikeThisMovies: movieLikeThisArray,
                   promotionHeadline: "Watch Season 6 now",
                   trailers: exampleTrailers)
    ].shuffled()
    
}
