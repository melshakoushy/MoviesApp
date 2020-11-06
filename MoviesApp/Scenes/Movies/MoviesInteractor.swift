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
}
