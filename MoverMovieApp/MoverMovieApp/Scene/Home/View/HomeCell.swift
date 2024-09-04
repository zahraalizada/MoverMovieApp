//
//  HomeCell.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
    var movies = [MovieResult]()
    var shows = [TvShowResult]()
    
    enum DataType {
        case movies
        case shows
    }
    var dataType: DataType = .movies
    
    var didItemSelected: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
    func configure(title: String, movies: [MovieResult]) {
        nameLabel.text = title
        self.movies = movies
        dataType = .movies
        collection.reloadData()
    }
    
    func configureTv(title: String, shows: [TvShowResult]) {
        nameLabel.text = title
        self.shows = shows
        dataType = .shows
        collection.reloadData()
    }
    
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        
    }

}


extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch dataType {
        case .movies:
            return movies.count
        case .shows:
            return shows.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        switch dataType {
        case .movies:
            cell.configure(data: movies[indexPath.item])
        case .shows:
            cell.configure(data: shows[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 140 , height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch dataType {
        case .movies:
             didItemSelected?(movies[indexPath.item].id ?? 0)
        case .shows:
             didItemSelected?(shows[indexPath.item].id ?? 0)
        }
        
        
    }
    
}
