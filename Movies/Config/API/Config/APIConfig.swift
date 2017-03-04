//
//  APIConfig.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Alamofire

enum APIConfig {
    case `default`
    
    var source: (host: String, headers: [String: String]?) {
        switch self {
        case .default:
            return (host: "https://api.themoviedb.org/3", headers: nil)
        }
    }
}
