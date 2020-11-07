//
//  MovieDetailsVC+PresenterDelegate.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import SKActivityIndicatorView
import Message

extension MovieDetailsVC: MovieDetailsView {
    
    func displayTitle(title: String) {
        self.title = title
        movieTitleLbl.text = title
    }
    
    func displayReleaseData(date: String) {
        movieReleaseDateLbl.text = date
    }
    
    func displayVoteAverage(voteAverage: String) {
        movieRatingLbl.text = voteAverage
    }
    
    func displayImg(imgUrl: String) {
        movieImg.loadImage_kf(imageUrl: imgUrl)
    }
    
    func displayOverview(overview: String) {
        movieDetailsLbl.text = overview
    }
    
    func showIndicator() {
        DispatchQueue.main.async {
            SKActivityIndicator.show()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            SKActivityIndicator.dismiss()
        }
    }
    
    func fetchingDataSuccess() {
        similarMoviesCollectionView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func navigateToMovieDetailsVC(movie: Results) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: movieDetailsVC) as! MovieDetailsVC
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAlert(Message: String) {
        DispatchQueue.main.async {
            Alert(withMessage: Message).show(andCloseAfter: 2.0)
        }
    }
}
