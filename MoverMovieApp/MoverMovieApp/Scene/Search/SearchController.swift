//
//  SearchController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configCollection()
        configureViewModel()
    }
    
    func configUI(){
        title = "Search"
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "Search movies..."
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.textWhite
            textField.textColor = UIColor.mainBgBlack
            textField.layer.cornerRadius = 8
            textField.clipsToBounds = true
        }
        
    }
    
    func configCollection() {
        collection.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "SearchCell")
        searchBar.delegate = self
    }
    
    func configureViewModel() {
        viewModel.getDiscoverMovies()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
}

extension SearchController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        cell.configure(with: viewModel.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 136)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = viewModel.items[indexPath.item]
        if let movieId = selectedMovie.id {
            let movieDetailCoordinator = MovieDetailCoordinator(navigationController: navigationController!, movieId: movieId, movieDetailManager: MovieDetailManager())
            movieDetailCoordinator.start()
        }
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            viewModel.searchMovies(query: searchText)
        } else {
            viewModel.items.removeAll()
            collection.reloadData()
        }
    }
}
