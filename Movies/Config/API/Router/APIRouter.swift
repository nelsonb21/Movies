//
//  APIRouter.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var config: APIConfig { get }
    var query: APIQuery { get }
}

extension APIRouter {
    
    //MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try config.source.host.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(query.path))
        urlRequest.httpMethod = query.httpMethod.rawValue
        urlRequest.addHTTPHeaders(config.source.headers)
        urlRequest.addHTTPHeaders(query.headers)
        let encoding = query.paremeterEncoding
        print (try encoding.encode(urlRequest, with: query.parameters))
        return try encoding.encode(urlRequest, with: query.parameters)
    }
    
}
