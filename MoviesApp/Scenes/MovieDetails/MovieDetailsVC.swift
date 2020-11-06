//
//  MovieDetailsVC.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieReleaseDateLbl: UILabel!
    @IBOutlet weak var movieDetailsLbl: UILabel!
    @IBOutlet weak var movieRatingLbl: UILabel!
    @IBOutlet weak var star1Btn: UIButton!
    @IBOutlet weak var star2Btn: UIButton!
    @IBOutlet weak var star3Btn: UIButton!
    @IBOutlet weak var star4Btn: UIButton!
    @IBOutlet weak var star5Btn: UIButton!
    @IBOutlet weak var star6Btn: UIButton!
    @IBOutlet weak var star7Btn: UIButton!
    @IBOutlet weak var star8Btn: UIButton!
    @IBOutlet weak var star9Btn: UIButton!
    @IBOutlet weak var star10Btn: UIButton!
    @IBOutlet weak var similarMoviesCollectionView: UICollectionView!
    
    // MARK: Variables
    var presenter: MovieDetailsVCPresenter!
    var movie: Results?
    
    // MARK: Constants
    let similarMovieCell = "SimilarMovieCell"
    let movieDetailsVC = "MovieDetailsVC"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter = MovieDetailsVCPresenter(view: self, movie: movie!)
        presenter.viewDidLoad()
    }
    
    @IBAction func star1BtnPressed(_ sender: Any) {
        presenter.vote(rate: 1)
    }
    @IBAction func star2BtnPressed(_ sender: Any) {
        presenter.vote(rate: 2)
    }
    @IBAction func star3BtnPressed(_ sender: Any) {
        presenter.vote(rate: 3)
    }
    @IBAction func star4BtnPressed(_ sender: Any) {
        presenter.vote(rate: 4)
    }
    @IBAction func star5BtnPressed(_ sender: Any) {
        presenter.vote(rate: 5)
    }
    @IBAction func star6BtnPressed(_ sender: Any) {
        presenter.vote(rate: 6)
    }
    @IBAction func star7BtnPressed(_ sender: Any) {
        presenter.vote(rate: 7)
    }
    @IBAction func star8BtnPressed(_ sender: Any) {
        presenter.vote(rate: 8)
    }
    @IBAction func star9BtnPressed(_ sender: Any) {
        presenter.vote(rate: 9)
    }
    @IBAction func star10BtnPressed(_ sender: Any) {
        presenter.vote(rate: 10)
    }
}
