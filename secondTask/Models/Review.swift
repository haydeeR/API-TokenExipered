//
//  Review.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/8/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import ObjectMapper

struct Review: Mappable {
    
    var id: Int
    var series_type: String
    var summary: String
    var rating: Int
    var rating_amount: Int
    var score: Int
    var date: Date
    var privated: Int
    var text: String
    
    init?(map: Map) {
        id =  0
        series_type = "Not found"
        summary = ""
        rating = 0
        rating_amount = 0
        score = 0
        date = Date()
        privated = 0 //False
        text = ""
    }
    
    mutating func mapping(map: Map) {
        id              <- map["id"]
        series_type     <- map["series_type"]
        summary         <- map["summary"]
        rating          <- map["rating"]
        rating_amount   <- map["rating_amount"]
        score           <- map["score"]
        date            <- (map["date"], DateTransform())
        privated        <- map["private"]
        text            <- map["text"]
    }
    
    
}
