//
//  HomeController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 14.08.24.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        title = "Movies"
        self.tabBarItem.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        collection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    
    func configureViewModel() {
        viewModel.getMovies()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let item = viewModel.items[indexPath.item]
        cell.delegate = self
        cell.configure(title: item.title ?? "", items: item.movies ?? [])
        cell.didItemSelected = { movieId in
            let coordinator = MovieDetailCoordinator(navigationController: self.navigationController ??  UINavigationController(), movieId: movieId, movieDetailManager: self.viewModel.movieDetailManager)
            coordinator.start()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 300)
    }
}

extension HomeController: ListProtocol {
    
    func didTapSeeAllButton(dataType: HomeCell.DataType, data: [MovieResult]?) {
        guard let movies = data else { return }
        let controller = storyboard?.instantiateViewController(withIdentifier: "ListController") as! ListController
        controller.movies = movies
        controller.listDataType = .movies
        self.navigationController?.show(controller, sender: nil)
    }
    
    func didTapSeeAllButton(dataType: HomeCell.DataType, data: [TvShowResult]?) {
        guard let shows = data else { return }
        let controller = storyboard?.instantiateViewController(withIdentifier: "ListController") as! ListController
        controller.shows = shows
        controller.listDataType = .shows
        self.navigationController?.show(controller, sender: nil)
    }
    
}


