//
//  MoviesDetailDataSource.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

typealias MoviesDetailDataSource = MoviesDetailViewController

extension MoviesDetailDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1+videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailInformationTableViewCell", for: indexPath) as! MovieDetailInformationTableViewCell
            cell.setupCell(movie: movie!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailVideoTableViewCell", for: indexPath) as! MovieDetailVideoTableViewCell
            let video = videos[indexPath.row-1]
            cell.setupCell(video: video)
            return cell
        }
    }

}
