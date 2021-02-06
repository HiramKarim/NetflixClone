//
//  TopRowButtons.swift
//  Netflim
//
//  Created by Hiram Castro on 24/01/21.
//

import SwiftUI

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    
    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        
        
        switch topRowSelection {
        case .home:
            
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                        .foregroundColor(.white)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                        .foregroundColor(.white)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                        .foregroundColor(.white)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.leading, 10)
            .padding(.trailing, 30)
            
            
        case .tvShows, .movies, .myList:
            HStack {
                
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:50)
                })
                .buttonStyle(PlainButtonStyle())
                
                
                HStack(spacing: 20) {
                    
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 10))
                        }
                        .foregroundColor(.white)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 13))
                            Image(systemName: "triangle.fill")
                                .rotationEffect(.degrees(180), anchor: .center)
                                .font(.system(size: 10))
                        }
                        .foregroundColor(.white)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            
        }
        
        
        
    }
}

struct TopRowButtons_Previews: PreviewProvider {
    static var previews: some View {
        TopRowButtons(topRowSelection: .constant(.tvShows),
                      homeGenre: .constant(.AllGenres),
                      showGenreSelection: .constant(true),
                      showTopRowSelection: .constant(true))
            .background(Color.black)
    }
}
