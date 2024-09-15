//
//  SearchManager.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 06.09.24.
//

import Foundation

class SearchManager {
    func getDiscoverMovies(completion: @escaping(Movie?, String?) -> Void) {
        NetworkManager.request(model: Movie.self, endpoint: SearchEndpoint.searchMovie.path, completion: completion)
    }
    
    func searchMovies(query: String, completion: @escaping (Movie?, String?) -> Void) {
        let parameters: [String: String] = ["query": query]
        NetworkManager.request(model: Movie.self, endpoint: SearchEndpoint.searchTextMovie.path, parameters: parameters, completion: completion)
    }
}
