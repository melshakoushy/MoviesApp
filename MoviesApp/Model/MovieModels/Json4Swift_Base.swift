//
//  Json4Swift_Base.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//


import Foundation
import ObjectMapper

struct Json4Swift_Base : Mappable {
	var results : [Results]?
	var page : Int?
	var total_results : Int?
	var dates : Dates?
	var total_pages : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		results <- map["results"]
		page <- map["page"]
		total_results <- map["total_results"]
		dates <- map["dates"]
		total_pages <- map["total_pages"]
	}

}
