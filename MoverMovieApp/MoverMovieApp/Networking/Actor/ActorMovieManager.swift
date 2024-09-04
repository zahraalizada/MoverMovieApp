//
//  ActorMovieManager.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 19.08.24.
//

import Foundation

class ActorMovieManager: MovieListUseCase {
    func getMovieList(endpoint: MovieEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkManager.request(model: Movie.self, endpoint: endpoint.rawValue, completion: completion)
    }

}
