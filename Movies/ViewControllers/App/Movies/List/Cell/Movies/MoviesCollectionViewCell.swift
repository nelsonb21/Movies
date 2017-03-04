//
//  MoviesCollectionViewCell.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieImageView: UIImageView?
    @IBOutlet weak var movieTitleLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(movie: Movie) {
        guard let title = movie.title else { return }
        movieTitleLabel?.text = title
        
        guard let imagePath = movie.posterPath else { return }
        guard let posterUrl = URL(string: APIQuery.getImageUrl(with: imagePath)) else { return }
        movieImageView?.setImage(with: posterUrl, placeholder: #imageLiteral(resourceName: "moviePosterPlaceholder"))
        
    }

}
