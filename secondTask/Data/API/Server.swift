//
//  Server.swift
//  secondTask
//
//  Created by Haydee Rodriguez on 5/14/18.
//  Copyright © 2018 Haydee Rodriguez. All rights reserved.
//

import Foundation
import Alamofire

struct Server {
    static var manager: SessionManager {
        let oauthHandler = OAuth2Handler(
            clientID: APIManager.client_id,
            client_secret: APIManager.client_secret,
            baseURLString: APIManager.basic_url,
            accessToken: APIManager.token_access,
            grantType: APIManager.grant_type
        )
        
        let sessionManager = SessionManager()
        sessionManager.adapter = oauthHandler
        sessionManager.retrier = oauthHandler
        return sessionManager
    }
}
