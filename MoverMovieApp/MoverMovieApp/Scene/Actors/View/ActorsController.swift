//
//  ActorsController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import UIKit

class ActorsController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = ActorsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        title = "Actors"
        self.tabBarItem.title = ""
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
    func configureViewModel() {
        viewModel.getActorList()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
    
}

extension ActorsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 30, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let actor = viewModel.items[indexPath.item]
        let coordinator = ActorDetailCoordinator(navigationController: self.navigationController ?? UINavigationController(), actorId: actor.id ?? 0)
            coordinator.start()
    }
}
