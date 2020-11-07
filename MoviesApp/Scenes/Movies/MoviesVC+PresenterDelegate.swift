//
//  MoviesVC+PresenterDelegate.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import SKActivityIndicatorView
import Message

extension MoviesVC: MoviesView {
    
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
        moviesTableView.reloadData()
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
