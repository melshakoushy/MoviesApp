//
//  Dates.swift
//  MoviesApp
//
//  Created by Mahmoud Elshakoushy on 11/6/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import ObjectMapper

struct Dates : Mappable {
	var maximum : String?
	var minimum : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		maximum <- map["maximum"]
		minimum <- map["minimum"]
	}

}
