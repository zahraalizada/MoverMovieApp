//
//  MovieManager.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 19.08.24.
//

import Foundation

class MovieManager {
    func getMovies(endpoint: MovieEndpoint, completion: @escaping(Movie?, String?) -> Void) {
        NetworkManager.request(model: Movie.self, endpoint: endpoint.rawValue, completion: completion)
    }
}
