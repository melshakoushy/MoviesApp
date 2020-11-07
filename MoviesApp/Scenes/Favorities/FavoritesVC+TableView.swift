//
//  FavoritesVC+TableView.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/7/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import UIKit

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.register(UINib(nibName: movieCell, bundle: nil), forCellReuseIdentifier: movieCell)
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCell, for: indexPath) as! MovieCell
        cell.favBtn.isHidden = true
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
