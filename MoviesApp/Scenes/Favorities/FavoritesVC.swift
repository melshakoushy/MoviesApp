//
//  SecondViewController.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var favoritesTableView: UITableView!

    // MARK: Variables
    var presenter: FavoritesVCPresenter!
    
    // MARK: Constants
    let movieCell = "MovieCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
        presenter = FavoritesVCPresenter(view: self)
        presenter.viewDidLoad()
    }
}

