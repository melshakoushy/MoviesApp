//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell, MovieCellView {
    
    // MARK: Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieDateLbl: UILabel!
    @IBOutlet weak var movieRateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func displayTitle(title: String) {
        movieTitleLbl.text = title
    }
    
    func displayReleaseData(date: String) {
        movieDateLbl.text = date
    }
    
    func displayVoteAverage(voteAverage: String) {
        movieRateLbl.text = voteAverage
    }
    
    func displayImg(imgUrl: String) {
        movieImg.loadImage_kf(imageUrl: imgUrl)
    }
}
