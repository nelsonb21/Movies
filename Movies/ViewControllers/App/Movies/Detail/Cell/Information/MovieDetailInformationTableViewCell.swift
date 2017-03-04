//
//  MovieDetailInformationTableViewCell.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

class MovieDetailInformationTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var moviePosterImageView: UIImageView?
    @IBOutlet weak var movieTitleLabel: UILabel?
    @IBOutlet weak var releaseDateLabel: UILabel?
    @IBOutlet weak var movieAverageLabel: UILabel?
    @IBOutlet weak var movieOverviewLabel: UILabel?
    @IBOutlet weak var movieLinkButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(movie: Movie) {
        guard let title = movie.title else { return }
        movieTitleLabel?.text = title
        
        if let releaseDate = movie.releaseDate {
            releaseDateLabel?.text = releaseDate
        }
        
        if let movieAverage = movie.voteAverage.value {
            movieAverageLabel?.text = "\(movieAverage)"
        }
        
        if let movieOverview = movie.overview {
            movieOverviewLabel?.text = movieOverview
        }
        
        if let movieLink = movie.homepage {
            movieLinkButton?.setTitle(movieLink, for: .normal)
            movieLinkButton?.isHidden = false
        } else {
            movieLinkButton?.isHidden = true
        }
        
        movieLinkButton?.removeTarget(self, action: nil, for: .allEvents)
        movieLinkButton?.addTarget(self, action: #selector(MovieDetailInformationTableViewCell.openWebsite), for: .touchUpInside)
        
        guard let imagePath = movie.posterPath else { return }
        guard let posterUrl = URL(string: APIQuery.getImageUrl(with: imagePath)) else { return }
        moviePosterImageView?.setImage(with: posterUrl, placeholder: #imageLiteral(resourceName: "moviePosterPlaceholder"))
        
    }
    
    func openWebsite() {
        guard let urlString = movieLinkButton?.title(for: .normal) else { return }
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
