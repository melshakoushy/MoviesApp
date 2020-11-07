//
//  FavoritesVC+PresenterDelegate.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/7/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation

import SKActivityIndicatorView

extension FavoritesVC: FavoriteMoviesView {
    
    func showIndicator() {
//        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
//        SKActivityIndicator.dismiss()
    }
    
    func fetchingDataSuccess() {
        favoritesTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
}
