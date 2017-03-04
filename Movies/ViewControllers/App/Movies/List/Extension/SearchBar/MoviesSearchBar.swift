//
//  MoviesSearchBar.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

typealias MoviesSearchBar = MoviesViewController

extension MoviesSearchBar: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        categoriesViewTopConstraint?.constant = -48
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        categoriesViewTopConstraint?.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn], animations: {
            self.view.layoutIfNeeded()
        }, completion: { _  in
            self.categoriesButton?.forEach({ (button) in
                if self.searchController?.searchBar.text != "" {
                    button.setTitleColor(.white, for: .normal)
                    button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
                }
            })
        })
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openSearchResults(query: searchBar.text!)
    }
    
    func openSearchResults(query: String) {
        MovieController.search(with: query) { (result, error) in
            if error == nil {
                guard let movies = result as? [Movie] else { return }
                self.movies = movies
                self.collectionView?.reloadData()
            }
        }
    }
    
}
