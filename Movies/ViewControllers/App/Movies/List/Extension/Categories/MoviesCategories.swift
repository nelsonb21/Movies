//
//  MoviesCategories.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

typealias MoviesCategories = MoviesViewController

enum Categories: String {
    case popular = "Popular"
    case topRated = "Top Rated"
    case upcoming = "Upcoming"
}

extension MoviesCategories {

    func categoriesHandler(categorieButton: UIButton) {
        guard let category = categorieButton.title(for: .normal) else { return }
        setupCategoryOptions(selectedButton: categorieButton)
        loadMovies(with: Categories.init(rawValue: category)!)
        searchController?.searchBar.resignFirstResponder()
    }
    
    private func setupCategoryOptions(selectedButton: UIButton) {
        categoriesButton?.forEach({ (button) in
            if selectedButton == button {
                button.setTitleColor(Color.selectedCategory, for: .normal)
                button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
            } else {
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
            }
        })
    }
    
}
