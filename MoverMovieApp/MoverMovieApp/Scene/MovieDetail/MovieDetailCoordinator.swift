//
//  MovieDetailCoordinator.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import Foundation
import UIKit

class MovieDetailCoordinator:Coordinator {

    var navigationController: UINavigationController
    var movieId: Int
    
    init(navigationController: UINavigationController, movieId: Int, movieDetailManager: MovieDetailManager?) {
        self.navigationController = navigationController
        self.movieId = movieId
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailController") as! MovieDetailController
        let movieDetailManager = MovieDetailManager()
        controller.viewModel = .init(movieId: movieId, movieDetailManager: movieDetailManager)
        navigationController.show(controller, sender: nil)
    }
}
