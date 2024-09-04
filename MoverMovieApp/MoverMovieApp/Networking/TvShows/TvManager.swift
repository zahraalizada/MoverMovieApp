//
//  TvManager.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 01.09.24.
//

import Foundation

class TvManager {
    func getTvShows(endpoint: TvEndpoint, completion: @escaping(TvShow?, String?) -> Void ) {
        NetworkManager.request(model: TvShow.self, endpoint: endpoint.rawValue, completion: completion)
    }
}
