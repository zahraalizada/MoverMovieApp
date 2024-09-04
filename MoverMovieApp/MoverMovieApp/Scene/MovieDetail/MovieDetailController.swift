//
//  MovieDetailController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import UIKit

class MovieDetailController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MovieDetail"
        
        viewModel?.success = { [weak self] in
            DispatchQueue.main.async {
                self?.collection.reloadData()
//                print(self?.viewModel?.movie)
            }
        }
        viewModel?.error = { errorMessage in
            print("Failed to fetch movie detail: \(errorMessage)")
        }
        
        viewModel?.getMovieDetail()
        
    }
}
