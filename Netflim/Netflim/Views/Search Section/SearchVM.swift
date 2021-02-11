//
//  SearchVM.swift
//  Netflim
//
//  Created by Hiram Castro on 09/02/21.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var viewState: ViewState = ViewState.ready
    
    @Published var popularMovies: [MovieModel] = []
    @Published var searchResult: [MovieModel] = []
    
    @Published var isShowingPopularMovies = true
    
    init() {
        getPopularMovies()
    }
    
    public func updateSearchTest(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true
        }
        
    }
    
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
    
    private func getPopularMovies() {
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(forText text: String) {
        
        let haveResult = Int.random(in: 0...3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                //empty view
                self.searchResult = []
                self.setViewState(to: .empty)
            } else {
                // ready view
                let movies = generateMovies(21)
                self.searchResult = movies
                self.setViewState(to: .ready)
            }
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
