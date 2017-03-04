//
//  APIQuery.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Alamofire

struct APIQuery {
    
    var headers: [String: String]?
    var httpMethod: Alamofire.HTTPMethod
    var path: String
    var parameters: [String: AnyObject]?
    var paremeterEncoding: Alamofire.ParameterEncoding = URLEncoding.default
    var cachePolicy: String = ""
    
    init(httpMethod: Alamofire.HTTPMethod, path: String) {
        self.httpMethod = httpMethod
        self.path = path
    }
    
    init(httpMethod: Alamofire.HTTPMethod, path: String, parameters: [String: AnyObject]?) {
        self.httpMethod = httpMethod
        self.path = path
        self.parameters = parameters
    }
    
}
