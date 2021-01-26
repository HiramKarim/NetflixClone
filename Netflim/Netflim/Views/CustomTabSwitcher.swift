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
    
    var tabs: [CustomTab]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id:\.self) { tab in
                        VStack {
                            //red bar
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                            // button
                            Button(action: {}, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                            })
                        }
                    }
                }
            }
            
            Text("SELECTED VIEW")
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
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more])
        }
    }
}
