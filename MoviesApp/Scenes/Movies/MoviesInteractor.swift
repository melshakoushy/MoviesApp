//
//  MoviesInteractor.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import RealmSwift

class MoviesInteractor {
    
    func getMovies(completionHandler: @escaping (_ movies: [Results]?, _ error: Error?)-> ()) {
        AF.request(BASE_URL).responseString(completionHandler: { (response) in
            let result = response.result
            switch result {
            case .success(let result):
                let responseModel = Mapper<Json4Swift_Base>().map(JSONString: result)
                completionHandler((responseModel?.results)!, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        })
    }
    
    
    let realm = try! Realm()
    
    func addFavoritesToRealm(movie: Results) {
        let favMovie = FavoriteMovie()
        favMovie.id = movie.id ?? 0
        favMovie.title = movie.title ?? ""
        favMovie.overview = movie.overview ?? ""
        favMovie.poster_path = movie.poster_path ?? ""
        favMovie.release_date = movie.release_date ?? ""
        favMovie.vote_average = movie.vote_average ?? 0
        realm.beginWrite()
        realm.add(favMovie)
        try! realm.commitWrite()
    }
}
