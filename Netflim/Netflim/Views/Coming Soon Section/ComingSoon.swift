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
    
    @ObservedObject private var vm = ComingSoonVM()
    
    var body: some View {
        
        NavigationView {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    TrackableScrollView(.vertical,
                                        showIndicators: false,
                                        contentOffset: $scrollOffset,
                                        content: <#T##() -> _#>)
                    
                    TrackableScrollView {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            
                            ForEach(vm.movies) { movie in
                                ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                            }
                        }
                    }
                    .foregroundColor(.white)
                }
                
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
        
    }
    
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
