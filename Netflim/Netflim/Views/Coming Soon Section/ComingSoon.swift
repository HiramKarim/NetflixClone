//
//  ComingSoon.swift
//  Netflim
//
//  Created by Hiram Castro on 17/02/21.
//

import SwiftUI

struct ComingSoon: View {
    
    @State private var showNotificationList = false
    @State private var navBarHidden = true
    @State private var movieDetailToShow: MovieModel? = nil
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject private var vm = ComingSoonVM()
    
    var body: some View {
        
        let movies = vm.movies.enumerated().map({ $0 })
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        
        //NavigationView {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical,
                                        showIndicators: false,
                                        contentOffset: scrollTrackingBinding) {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(Array(movies), id: \.offset) { index, movie in
                                ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                    .frame(height: 400)
                                    .overlay(
                                        Group {
                                            index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                        }
                                        .animation(.easeInOut)
                                    )
                            }
                        }
                    }
                    .foregroundColor(.white)
                    
                    NavigationLink(
                        destination: Text("Notification List"),
                        isActive: $showNotificationList,
                        label: {
                            EmptyView()
                        })
                        .navigationTitle("")
                        .navigationBarHidden(navBarHidden)
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                            self.navBarHidden = true
                        })
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                            self.navBarHidden = false
                        })
                    
                }
            }
        //}
        
    }
    
    private func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        } else {
            let removeNavBar = scroll - 105
            let active = Int(removeNavBar / 410) + 1
            activeIndex = Int(active)
        }
    }
    
}



struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
