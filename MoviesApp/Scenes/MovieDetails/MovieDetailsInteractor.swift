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

class MovieDetailsInteractor {
    func rateMovie(movieId: Int, rating: Int)  {
        let parameters : [String:Any] = [
            "value" : rating
        ]
        
        let HEADER : HTTPHeaders = [
            "Content-Type" : "application/json;charset=utf-8"
        ]
        
        let rateUrl = "https://api.themoviedb.org/3/movie/\(movieId)/rating?api_key=c15dfe5ebee8f16a1d43615304757850&guest_session_id=ca6cade5853808afe18540c697933132"
        print(rateUrl)
        
        AF.request(rateUrl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: HEADER).responseJSON { (response) in
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
}

