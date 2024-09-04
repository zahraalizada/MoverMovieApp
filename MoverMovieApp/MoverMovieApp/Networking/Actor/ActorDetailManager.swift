//
//  ActorDetailManager.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 03.09.24.
//

import Foundation

class ActorDetailManager {
    func getActorDetails(actorId: Int, completion: @escaping(ActorData?, String?) -> Void) {
        let apiKey = "c16ef035b8f21ce0a8f66915bab8e5f3"
        let endpoint = "https://api.themoviedb.org/3/person/\(actorId)?api_key=\(apiKey)&language=en-US"
        NetworkManager.request(model: ActorData.self, endpoint: endpoint, completion: completion)
    }
}
