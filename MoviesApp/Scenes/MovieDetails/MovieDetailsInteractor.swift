//
//  MovieDetailsInteractor.swift
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

class MovieDetailsInteractor {
    func rateMovie(movieId: Int, rating: Int)  {
        let parameters : [String:Any] = [
            "value" : rating
        ]
        
        let HEADER : HTTPHeaders = [
            "Content-Type" : "application/json;charset=utf-8"
        ]
        
        let rateUrl = "https://api.themoviedb.org/3/movie/\(movieId)/rating?api_key=c15dfe5ebee8f16a1d43615304757850&guest_session_id=c0ca249f2023b43a2c70fd565dbcc881"
        print(rateUrl)
        
        AF.request(rateUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                print(value)
            }
        }
    }
    
    func getSimilarMovies(movieId: Int,completionHandler: @escaping (_ movies: [Results]?, _ error: Error?)-> ()) {
        let similarURL = "https://api.themoviedb.org/3/movie/\(movieId)/similar?api_key=c15dfe5ebee8f16a1d43615304757850&language=en-US&page=1"
        
        AF.request(similarURL).responseString(completionHandler: { (response) in
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

