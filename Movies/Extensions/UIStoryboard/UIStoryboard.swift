//
//  UIStoryboard.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

extension UIStoryboard {

    static func viewController(withIdentifier identifier: String) -> UIViewController {
        return self.viewController(withIdentifier: identifier, storyBoardIdentifier: identifier)
    }
    
    static func viewController(withIdentifier identifier: String, storyBoardIdentifier: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyBoardIdentifier, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: identifier)
    }
    
}
