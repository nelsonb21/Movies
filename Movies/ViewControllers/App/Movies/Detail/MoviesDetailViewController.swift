//
//  MoviesDetailViewController.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

class MoviesDetailViewController: UIViewController {
    
    @IBOutlet weak var movieBackgroundImageView: UIImageView?
    @IBOutlet weak var tableView: UITableView?
    
    var movieId: String?
    var movie: Movie?
    var videos: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.tableFooterView = UIView()
        
        MovieController.detail(with: movieId!) { (result, error) in
            if error == nil {
                guard let movie = result as? Movie else { return }
                self.movie = movie
                self.setupViewBackground()
                VideoController.getVideos(with: self.movieId!, completion: { (result, error) in
                    if error == nil {
                        guard let videos = result as? [Video] else { return }
                        self.videos = videos
                    }
                    self.setupView()
                })
            }
        }
    }
    
    private func setupView() {
        tableView?.register(withIdentifier: "MovieDetailInformationTableViewCell")
        tableView?.register(withIdentifier: "MovieDetailVideoTableViewCell")
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.tableFooterView = UIView()
        tableView?.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupViewBackground() {
        guard let imagePath = movie?.posterPath else { return }
        guard let posterUrl = URL(string: APIQuery.getImageUrl(with: imagePath)) else { return }
        movieBackgroundImageView?.setImage(with: posterUrl, placeholder: #imageLiteral(resourceName: "moviePosterPlaceholder"))
        
    }

}
