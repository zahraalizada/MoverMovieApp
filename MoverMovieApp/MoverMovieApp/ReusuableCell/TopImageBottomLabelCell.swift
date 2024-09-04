//
//  TopImageBottomLabelCell.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import UIKit

protocol TopImageBottomLabelProtocol {
    var  imageName: String { get }
    var  labelText: String { get }
}


class TopImageBottomLabelCell: UICollectionViewCell {

    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(data: TopImageBottomLabelProtocol) {
        bottomLabel.text = data.labelText
        topImage.loadImage(path: data.imageName)
    }
    

}
