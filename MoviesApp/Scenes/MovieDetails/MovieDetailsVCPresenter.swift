//
//  MovieDetailsVCPresenter.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation

protocol MovieDetailsView: class {
    func displayTitle(title: String)
    func displayReleaseData(date: String)
    func displayVoteAverage(voteAverage: String)
    func displayImg(imgUrl: String)
    func displayOverview(overview: String)
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func navigateToMovieDetailsVC(movie: Results)
    func showAlert(Message: String)
}

protocol SimilarMovieCellView {
    func displayImg(imgUrl: String)
}

class MovieDetailsVCPresenter {
    
    private weak var view: MovieDetailsView?
    private let interactor = MovieDetailsInteractor()
    private var movie: Results
    private var similarMovies = [Results]()
    
    init(view: MovieDetailsView, movie: Results) {
        self.view = view
        self.movie = movie
    }
    
    func viewDidLoad() {
        loadData()
        loadSimilarMovies()
    }
    
    func loadData() {
        view?.displayTitle(title: movie.title ?? "" )
        view?.displayReleaseData(date: movie.release_date ?? "" )
        view?.displayVoteAverage(voteAverage: "\(String(describing: movie.vote_average ?? 0))")
        view?.displayImg(imgUrl: IMG_BASE_URL + (movie.poster_path ?? ""))
        view?.displayOverview(overview: movie.overview ?? "")
    }
    
    func loadSimilarMovies() {
        view?.showIndicator()
        interactor.getSimilarMovies(movieId: movie.id ?? 0) { [weak self] (similarMovies, error) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            if let error = error {
            self.view?.showError(error: error.localizedDescription)
            } else {
                guard let similarMovies = similarMovies else { return }
                self.similarMovies = similarMovies
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func vote(rate: Int) {
//        view?.showIndicator()
        interactor.rateMovie(movieId: movie.id ?? 0, rating: rate)
        view?.showAlert(Message: "Your vote sent successfully")
//        view?.hideIndicator()
    }
    
    func configure(cell: SimilarMovieCellView, for index: Int) {
        let movie = similarMovies[index]
        cell.displayImg(imgUrl: IMG_BASE_URL + (movie.poster_path ?? ""))
    }
    
    func getSimilarMoviesCount() -> Int {
        return similarMovies.count
    }
    
    func didSelectRow(index: Int) {
        let movie = similarMovies[index]
        view?.navigateToMovieDetailsVC(movie: movie)
    }
}
