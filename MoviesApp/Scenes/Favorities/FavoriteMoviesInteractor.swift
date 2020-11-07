//
//  FavoriteMoviesInteractor.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/7/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import RealmSwift

class FavoriteMoviesInteractor {
    
    let realm = try! Realm()

    func getFavoriteMovies() -> [Results] {
        let favoriteMovies = realm.objects(FavoriteMovie.self)
        var movies = [Results]()
        for favoriteMovie in favoriteMovies {
            var movie = Results()
            movie?.id = favoriteMovie.id
            movie?.title = favoriteMovie.title
            movie?.vote_average = favoriteMovie.vote_average
            movie?.overview = favoriteMovie.overview
            movie?.release_date = favoriteMovie.release_date
            movie?.poster_path = favoriteMovie.poster_path
            movies.append(movie!)
        }
        return movies
    }
}
