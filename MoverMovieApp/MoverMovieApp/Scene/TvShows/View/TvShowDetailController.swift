//
//  TvShowDetailController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 03.09.24.
//

import UIKit

class TvShowDetailController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel: TvShowDetailViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tv Show Detail"
        
        viewModel?.success = { [weak self] in
            DispatchQueue.main.async {
                self?.collection.reloadData()
//                print(self?.viewModel?.tvShow)
            }
        }
        
        viewModel?.error = { errorMessage in
            print("Error loading actor details: \(errorMessage)")
        }
        viewModel?.getTvShowDetail()
    }
}
