//
//  UITableView.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

extension UITableView {

    func register(withIdentifier identifier: String) {
        self.register(withIdentifier: identifier, nibIdentifier: identifier)
    }
    
    func register(withIdentifiers identifiers: [String]) {
        for identifier in identifiers {
            self.register(withIdentifier: identifier, nibIdentifier: identifier)
        }
    }
    
    func register(withIdentifier identifier: String, nibIdentifier: String) {
        self.register(UINib(nibName: nibIdentifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
}
