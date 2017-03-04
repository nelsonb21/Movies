//
//  MoviesCollectionViewDelegate.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

typealias MoviesCollectionViewDelegate = MoviesViewController

extension MoviesCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = (collectionViewSize.width)/2.0 //Display Two elements in a row.
        collectionViewSize.height = collectionViewSize.width
        return collectionViewSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        openMovieDetail(movieId: "\(movie.id.value!)")
    }
    
}
