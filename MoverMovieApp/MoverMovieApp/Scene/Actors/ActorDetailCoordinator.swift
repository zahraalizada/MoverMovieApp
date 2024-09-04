//
//  ActorDetailCoordinator.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 03.09.24.
//

import Foundation
import UIKit

class ActorDetailCoordinator:Coordinator {
    
    var navigationController: UINavigationController
    var actorId: Int
    
    init(navigationController: UINavigationController, actorId: Int) {
        self.navigationController = navigationController
        self.actorId = actorId
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActorDetailController") as! ActorDetailController
        let actorDetailManager = ActorDetailManager()
        controller.viewModel = .init(actorId: actorId, actorDetailManager: actorDetailManager)
        navigationController.show(controller, sender: nil)
    }
}
