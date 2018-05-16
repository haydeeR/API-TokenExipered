//
//  ParseHandler.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/9/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import ObjectMapper

struct ParseHandler {
    
    static func parseReviewLatest(json: [String:Any]) -> ReviewLatest? {
        guard let reviewLatest = Mapper<ReviewLatest>().map(JSON: json) else {
            return nil
        }
        return reviewLatest
    }
}
