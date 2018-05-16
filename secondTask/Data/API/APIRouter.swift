//
//  APIRouter.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/8/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    case getReviewsLatest
    
    var route: String {
        switch self {
        case .getReviewsLatest:
            return "reviews/latest"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var parametters: [String:Any] {
        switch self {
        case .getReviewsLatest:
            return ["access_token":APIManager.token_access]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIManager.basic_url.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(route))
        urlRequest.httpMethod = method.rawValue
        return try URLEncoding.methodDependent.encode(urlRequest, with: parametters)
    }
}
