//
//  SearchViewModel.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import Foundation

class SearchViewModel {
    
    var items = [MovieResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    let searchManager = SearchManager()
    
    func getDiscoverMovies() {
        searchManager.getDiscoverMovies { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                print(data)
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
    
    func searchMovies(query: String) {
        searchManager.searchMovies(query: query) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data = data {
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
    
}
