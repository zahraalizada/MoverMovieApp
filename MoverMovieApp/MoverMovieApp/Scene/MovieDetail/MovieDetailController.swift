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
        
        configureUI()
        configureCollection()
        configureViewModel()
    }
    

    func configureUI() {
        title = "MovieDetail"
    }
    
    func configureCollection() {
        collection.register(UINib(nibName: "MovieDetailCell", bundle: nil), forCellWithReuseIdentifier: "MovieDetailCell")
        
    }
    
    func configureViewModel() {
        viewModel?.success = { [weak self] in
            DispatchQueue.main.async {
                self?.collection.reloadData()
                print(self?.viewModel?.movie)
            }
        }
        viewModel?.error = { errorMessage in
            print("Failed to fetch movie detail: \(errorMessage)")
        }
        viewModel?.getMovieDetail()
    }
}

extension MovieDetailController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel?.movie.count ?? 0
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
//        cell.titleLabel.text = viewModel?.movie[indexPath.item].title
//        if let movie = viewModel?.movie[indexPath.item] {
//            cell.titleLabel.text = movie.title
//        }
        cell.titleLabel.text = viewModel?.movie?.title
         
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200) // Bu boyutları gerektiği şekilde ayarlayın
    }
    
    
}
