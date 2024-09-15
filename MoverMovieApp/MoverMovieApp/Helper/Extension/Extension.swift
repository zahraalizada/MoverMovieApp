//
//  Extension.swift
//  MoverMovieApp
//
//  Created by Zahra Alizada on 24.08.24.
//

import UIKit
import Foundation
import Kingfisher

extension UIImageView {
    func loadImage(path: String) {
        let url = "\(NetworkConstants.baseImageUrl)\(path)"
        self.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "placeholder"))
    }
}

extension UIViewController {
    
}
