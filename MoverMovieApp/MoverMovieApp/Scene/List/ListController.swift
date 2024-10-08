//
//  ListController.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 04.09.24.
//

import UIKit

class ListController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    var movies: [MovieResult] = []
    var shows: [TvShowResult] = []
    
    var listDataType: ListDataType = .shows

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List Controller"
        setupCollectionView()
        loadData()
    }
    
    func setupCollectionView() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
       
    func loadData() {
        switch listDataType {
        case .movies:
            title = "Movies List"
        case .shows:
            title = "TV Shows List"
        }
        collection.reloadData()
    }
}


extension ListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch listDataType {
        case .movies:
            return movies.count
        case .shows:
            return shows.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        switch listDataType {
        case .movies:
            let movie = movies[indexPath.item]
            cell.configure(data: movie)
        case .shows:
            let show = shows[indexPath.item]
            cell.configure(data: show)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 140, height: 260)
    }
}
