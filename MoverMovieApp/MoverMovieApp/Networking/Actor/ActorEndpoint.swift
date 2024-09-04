//
//  ActorEndpoint.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 19.08.24.
//

import Foundation

enum ActorEndpoint {
    case movieListActor (id: Int)
    case soundtrasckOfActor (page: Int)
    case popularActors
    
    var path: String {
        switch self {
        case .movieListActor(let id):
            return "person/\(id)/movie_credits"
        case .soundtrasckOfActor(let page):
            return "person/\(page)/soundtracks"
        case .popularActors:
            return "person/popular"
        }
    }
}
