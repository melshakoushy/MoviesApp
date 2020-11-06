//
//  MoviesVC+PresenterDelegate.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import SKActivityIndicatorView

extension MoviesVC: MoviesView {
    func showIndicator() {
//        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
//        SKActivityIndicator.dismiss()
    }
    
    func fetchingDataSuccess() {
        moviesTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
}
