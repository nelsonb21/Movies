//
//  MovieRouter.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Alamofire

enum MovieRouter: APIRouter {
    
    case listPopularity()
    case listTopRated()
    case listUpcoming()
    case movieDetail(id: String)
    case searchMovie(query: String)
    
    var query: APIQuery {
        switch self {
        case .listPopularity():
            return APIQuery(httpMethod: .get, path: "movie/popular")
        case .listTopRated():
            return APIQuery(httpMethod: .get, path: "movie/top_rated")
        case .listUpcoming():
            return APIQuery(httpMethod: .get, path: "movie/upcoming")
        case .movieDetail(let id):
            return APIQuery(httpMethod: .get, path: "movie/"+id)
        case .searchMovie(let query):
            return APIQuery(httpMethod: .get, path: "search/movie", parameters: ["query": query as AnyObject])
        }
    }
    
    var config: APIConfig {
        return .default
    }
    
}
