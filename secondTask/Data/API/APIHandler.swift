//
//  APIHandler.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/8/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

struct APIHandler {
    
    static let sessionManager = Server.manager
    
    static func getReviews() -> Promise<[String:Any]> {
        return Promise { seal in
            sessionManager.request(APIRouter.getReviewsLatest).responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    if let json = response.result.value as? [String: Any] {
                        seal.fulfill(json)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            })
        }
    }
}
