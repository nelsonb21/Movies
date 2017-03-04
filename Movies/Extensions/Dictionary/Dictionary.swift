//
//  Dictionary.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }

}
