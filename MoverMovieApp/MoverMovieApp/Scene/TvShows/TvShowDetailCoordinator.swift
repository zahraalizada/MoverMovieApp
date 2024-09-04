//
//  TvShowDetailCoordinator.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 04.09.24.
//

import Foundation
import UIKit

class TvShowDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var seriesId: Int
    
    init(navigationController: UINavigationController, seriesId: Int) {
        self.navigationController = navigationController
        self.seriesId = seriesId
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TvShowDetailController") as! TvShowDetailController
        let tvShowDetailManager = TvShowDetailManager()
        controller.viewModel = .init(seriesId: seriesId, tvShowDetailManager: tvShowDetailManager)
        navigationController.show(controller, sender: nil)
    }
}
