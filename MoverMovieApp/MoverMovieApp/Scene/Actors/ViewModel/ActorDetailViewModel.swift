//
//  ActorDetailModelView.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 30.08.24.
//

import Foundation

class ActorDetailViewModel {
    let actorDetailManager: ActorDetailManager?
    
    var actorId: Int = 0
    var actor = [ActorData]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(actorId: Int, actorDetailManager: ActorDetailManager?, success: ( () -> Void)? = nil, error: ( (String) -> Void)? = nil) {
        self.actorDetailManager = actorDetailManager
        self.actorId = actorId
        self.success = success
        self.error = error
    }
    
    func getActorDetail() {
        actorDetailManager?.getActorDetails(actorId: actorId, completion: { data, errorMessage in
            if let errorMessage {
                print("Error: \(errorMessage)")
                self.error?(errorMessage)
            } else if let data {
//                print("Data: \(data)")
                self.actor.append(data)
                self.success?()
            }
        })
    }
}
