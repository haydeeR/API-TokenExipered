//
//  DataHandler.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/9/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import PromiseKit

struct DataHandler {
    
    static func getReviews() -> Promise<ReviewLatest> {
        return APIHandler.getReviews().map({ reviews -> ReviewLatest in
            return ParseHandler.parseReviewLatest(json: reviews)!
        })
    }
}
