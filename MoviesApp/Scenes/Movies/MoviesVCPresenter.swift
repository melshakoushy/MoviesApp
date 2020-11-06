//
//  MoviesVCPresenter.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation

protocol MoviesView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
}

protocol MovieCellView {
    func displayTitle(title: String)
    func displayReleaseData(date: String)
    func displayVoteAverage(voteAverage: String)
    func displayImg(imgUrl: String)
}

class MoviesVCPresenter {
    
    private weak var view: MoviesView?
    private let interactor = MoviesInteractor()
    private var movies = [Results]()
    
    init(view: MoviesView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getUsers()
    }
    
    func getUsers() {
        view?.showIndicator()
        interactor.getMovies { [weak self] (movies, error) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let movies = movies else { return }
                self.movies = movies.sorted { $0.title ?? "" < $1.title ?? "" }
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func getUsersCount() -> Int {
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
