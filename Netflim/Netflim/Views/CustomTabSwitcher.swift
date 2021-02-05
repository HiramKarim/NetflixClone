//
//  CustomTabSwitcher.swift
//  Netflim
//
//  Created by Hiram Castro on 25/01/21.
//

import SwiftUI

enum CustomTab:String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher: View {
    
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    var movie: MovieModel
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id:\.self) { tab in
                        VStack {
                            //red bar
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? Color.red : Color.clear)
                            // button
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                            })
                            .frame(width: widthForTab(tab), height: 30)
                        }
                    }
                }
            }
            
            switch currentTab {
            case .episodes:
                EpisodesView(episodes: movie.episodes ?? [],
                             showSeasonPicker: $showSeasonPicker,
                             selectedSeason: $selectedSeason)
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLineThisView(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}

func widthForTab(_ tab: CustomTab) -> CGFloat {
    let string = tab.rawValue
    return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more],
                              movie: helper.moviesArray[5],
                              showSeasonPicker: .constant(false),
                              selectedSeason: .constant(1))
        }
    }
}
