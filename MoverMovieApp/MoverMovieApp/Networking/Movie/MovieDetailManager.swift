//
//  MovieDetailManager.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 03.09.24.
//

import Foundation

class MovieDetailManager {
    func getMovieDetails(endpoint: String?, completion: @escaping(MovieResult?, String?) -> Void) {
        NetworkManager.request(model: MovieResult.self, endpoint: endpoint ?? "", completion: completion)
    }
}
