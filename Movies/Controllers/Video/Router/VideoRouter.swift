//
//  VideoRouter.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Alamofire

enum VideoRouter: APIRouter {
    
    case getVideos(movieId: String)
    
    var query: APIQuery {
        switch self {
        case .getVideos(let movieId):
            return APIQuery(httpMethod: .get, path: "movie/"+movieId+"/videos")
        }
    }
    
    var config: APIConfig {
        return .default
    }
    
}
