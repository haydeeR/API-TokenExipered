//
//  ReviewLatest.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/9/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import ObjectMapper

struct ReviewLatest: Mappable {
    var anime: [Review]?
    var manga: [Review]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        anime <- map["anime"]
        manga <- map["manga"]
    }
    
}
