//
//  ActorsViewModel.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import Foundation

class ActorsViewModel {
    
    var items = [ActorData]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    let actorManager = ActorManager()
    
    func getActorList() {
        actorManager.getActors() { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
    
}
