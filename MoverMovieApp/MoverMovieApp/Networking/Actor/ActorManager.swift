//
//  ActorManager.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 19.08.24.
//

import Foundation

class ActorManager {
    func getActors(completion: @escaping(Actor?, String?) -> Void) {
        NetworkManager.request(model: Actor.self, endpoint: ActorEndpoint.popularActors.path, completion: completion)
    }
}
