//
//  FavoriteMovieModel.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/7/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import RealmSwift

class FavoriteMovie: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var poster_path: String = ""
    @objc dynamic var vote_average: Double = 0
    @objc dynamic var overview: String = ""
    @objc dynamic var release_date: String = ""
}
