//
//  MoviesDetailTableViewDelegate.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

typealias MoviesDetailTableViewDelegate = MoviesDetailViewController

extension MoviesDetailTableViewDelegate: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
