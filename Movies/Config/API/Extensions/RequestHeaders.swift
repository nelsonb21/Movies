//
//  RequestHeaders.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

extension URLRequest {
    
    mutating func addHTTPHeaders(_ headers: [String: String]?) {
        guard let headers = headers else { return }
        for (key, value) in headers {
            setValue(value, forHTTPHeaderField: key)
        }
    }
    
}
