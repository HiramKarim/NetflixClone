//
//  EpisodesView.swift
//  Netflim
//
//  Created by Hiram Castro on 29/01/21.
//

import SwiftUI

struct EpisodesView: View {
    var episodes: [Episode]
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    var body: some View {
        
        VStack {
            // season picker
            HStack {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season 1")
                        Image(systemName: "chevron.down")
                    }
                    .font(.system(size: 16))
                })
                Spacer()
            }
            
            
            //episodes list
            
            ForEach(getEpisodes(forSeason: selectedSeason)) {
                episode in
                Text("test")
            }
            
            Spacer()
        }
        .foregroundColor(.white)
        
    }
    
    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter({
            $0.season == season
        })
    }
}


struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        let helper = Helper()
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            EpisodesView(episodes: helper.allEpisodes, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
