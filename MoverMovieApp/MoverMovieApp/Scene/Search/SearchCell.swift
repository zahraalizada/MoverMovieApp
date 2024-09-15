//
//  SearchCell.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 03.09.24.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with movie: MovieResult) {
        titleLabel.text = movie.title ?? "Unknown Title"
        rateLabel.text = String(format: "%.1f", movie.voteAverage ?? 0.0)
        durationLabel.text = movie.releaseDate ?? "Unknown"
        if let posterPath = movie.posterPath {
            searchImage.loadImage(path: posterPath)
        } else {
            searchImage.image = UIImage(named: "placeholder")
        }
    }
}


