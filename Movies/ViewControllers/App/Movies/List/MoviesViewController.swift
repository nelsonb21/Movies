//
//  MoviesViewController.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet var categoriesButton: [UIButton]?
    @IBOutlet weak var categoriesViewTopConstraint: NSLayoutConstraint?
    
    var movies: [Movie] = []
    
    var searchController: UISearchController?

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupView()
        loadPopularMovies()
        
        /*MovieController.search(with: "thor") { (result, error) in
            print(result)
        }*/
    }
    
    private func setupView() {
        collectionView?.register(withIdentifier: "MoviesCollectionViewCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    private func setupNavBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.searchBar.placeholder = "Search for movies"
        searchController?.searchBar.tintColor = .black
        searchController?.searchBar.barStyle = .default
        searchController?.searchBar.returnKeyType = .done
        searchController?.searchBar.delegate = self
        
        navigationItem.titleView = searchController?.searchBar
    }
    
    //MARK: - IBActions
    
    @IBAction func categorySelectAction(_ sender: UIButton) {
        categoriesHandler(categorieButton: sender)
    }
    
    //MARK: - Categories Handler
    
    func loadMovies(with category: Categories) {
        switch category {
        case .popular:
            loadPopularMovies()
        case .topRated:
            loadTopRatedMovies()
        case .upcoming:
            loadUpcomingMovies()
        }
    }
    
    //MARK: - Request

    private func loadPopularMovies() {
        MovieController.list(with: .listPopularity(), completion: { (result, error) in
            if error == nil {
                guard let movies = result as? [Movie] else { return }
                self.movies = movies
                self.collectionView?.reloadData()
            }
        })
    }
    
    private func loadTopRatedMovies() {
        MovieController.list(with: .listTopRated(), completion: { (result, error) in
            if error == nil {
                guard let movies = result as? [Movie] else { return }
                self.movies = movies
                self.collectionView?.reloadData()
            }
        })
    }
    
    private func loadUpcomingMovies() {
        MovieController.list(with: .listUpcoming(), completion: { (result, error) in
            if error == nil {
                guard let movies = result as? [Movie] else { return }
                self.movies = movies
                self.collectionView?.reloadData()
            }
        })
    }
    
    //MARK: - Methods
    
    func openMovieDetail(movieId: String) {
        guard let moviesDetailViewController = UIStoryboard.viewController(withIdentifier: "MoviesDetailViewController") as? MoviesDetailViewController else { return }
        moviesDetailViewController.movieId = movieId
        navigationController?.pushViewController(moviesDetailViewController, animated: true)
    }

}

