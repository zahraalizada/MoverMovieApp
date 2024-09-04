//
//  ActorDetailController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 30.08.24.
//

import UIKit

class ActorDetailController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel: ActorDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Actor Detail"
        
        viewModel?.success = { [weak self] in
            DispatchQueue.main.async {
                self?.collection.reloadData()
//                print(self?.viewModel?.actor)
            }
        }
        
        viewModel?.error = { errorMessage in
            print("Error loading actor details: \(errorMessage)")
        }
        viewModel?.getActorDetail()
    }
     
    
    
    
}

extension ActorDetailController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        return cell
    }
    
    
}
