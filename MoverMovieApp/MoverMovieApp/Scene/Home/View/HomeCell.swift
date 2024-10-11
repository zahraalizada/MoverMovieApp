//
//  HomeCell.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import UIKit

protocol ListProtocol: AnyObject {
    func didTapSeeAllButton(dataType: HomeCell.DataType, data: [MovieResult]?)
    func didTapSeeAllButton(dataType: HomeCell.DataType, data: [TvShowResult]?)
}

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
    var movies = [MovieResult]()
    var shows = [TvShowResult]()
    
    var items = [TopImageBottomLabelProtocol]()
    
    enum DataType {
        case movies
        case shows
    }
    var dataType: DataType = .movies
    weak var delegate: ListProtocol?
    
    var didItemSelected: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
    func configure(title: String, items: [TopImageBottomLabelProtocol]) {
        nameLabel.text = title
        self.items = items
        if let item = items as? [MovieResult] {
            configure(title: title, movies: item)
        } else if let item = items as? [TvShowResult] {
            configureTv(title: title, shows: item)
        }
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
        switch dataType {
        case .movies:
            delegate?.didTapSeeAllButton(dataType: .movies, data: movies)
        case .shows:
            delegate?.didTapSeeAllButton(dataType: .shows, data: shows)
        }
    }
}


extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 140 , height: 260)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        didItemSelected?(indexPath.item)
        
//        let movie = movies[indexPath.item]
//        didItemSelected?(movie.id ?? 0)
        
        switch dataType {
           case .movies:
               let movie = movies[indexPath.item]
               didItemSelected?(movie.id ?? 0) // Movie ID'sini ilet
           case .shows:
               let show = shows[indexPath.item]
               didItemSelected?(show.id ?? 0) // TV Show ID'sini ilet
           }
        
        
    }
    
}
