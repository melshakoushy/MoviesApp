//
//  SimilarMovieCell.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class SimilarMovieCell: UICollectionViewCell, SimilarMovieCellView {
    
    // MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var movieImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayImg(imgUrl: String) {
        movieImg.loadImage_kf(imageUrl: imgUrl)
    }
}
