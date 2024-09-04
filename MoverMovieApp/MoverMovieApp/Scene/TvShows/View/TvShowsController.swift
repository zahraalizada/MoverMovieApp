//
//  TvShowsController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import UIKit

class TvShowsController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    private let viewModel = TvShowsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        title = "TV Shows"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        collection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    
    func configureViewModel() {
        viewModel.getTvShows()
        viewModel.error = { errorMessage in
            print("Error \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
}

extension TvShowsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let item = viewModel.items[indexPath.item]
        cell.configureTv(title: item.name ?? "", shows: item.shows ?? [])
        cell.didItemSelected = { seriesId in
            let coordinator = TvShowDetailCoordinator(navigationController: self.navigationController ??  UINavigationController(), seriesId: seriesId)
            coordinator.start()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 300)
    }
}

