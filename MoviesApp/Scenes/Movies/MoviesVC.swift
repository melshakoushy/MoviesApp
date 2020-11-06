//
//  FirstViewController.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: Variables
    var presenter: MoviesVCPresenter!
    
    // MARK: Constants
    let movieCell = "MovieCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = MoviesVCPresenter(view: self)
        presenter.viewDidLoad()
    }
}

