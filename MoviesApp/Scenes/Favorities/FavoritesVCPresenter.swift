//
//  FavoritesVCPresenter.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/7/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation

protocol FavoriteMoviesView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
}

class FavoritesVCPresenter  {
    
    private weak var view: FavoriteMoviesView?
    private let interactor = FavoriteMoviesInteractor()
    private var movies = [Results]()
    
    init(view: FavoriteMoviesView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getMovies()
    }
    
    func getMovies() {
        view?.showIndicator()
        movies = interactor.getFavoriteMovies()
        view?.fetchingDataSuccess()
        view?.hideIndicator()
    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
    func configure(cell: MovieCellView, for index: Int) {
        let movie = movies[index]
        cell.displayTitle(title: movie.title ?? "" )
        cell.displayReleaseData(date: movie.release_date ?? "" )
        cell.displayVoteAverage(voteAverage: "\(String(describing: movie.vote_average ?? 0))")
        cell.displayImg(imgUrl: IMG_BASE_URL + (movie.poster_path ?? ""))
    }
}
