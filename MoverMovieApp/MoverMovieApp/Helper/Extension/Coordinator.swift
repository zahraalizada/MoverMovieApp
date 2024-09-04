//
//  Coordinator.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
