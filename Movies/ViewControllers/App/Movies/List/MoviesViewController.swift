//
//  MoviesViewController.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

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
                MovieController.update(movies: movies)
                self.movies = movies
                self.collectionView?.reloadData()
            } else {
                self.loadLocalMovies()
            }
        })
    }
    
    private func loadTopRatedMovies() {
        MovieController.list(with: .listTopRated(), completion: { (result, error) in
            if error == nil {
                guard let movies = result as? [Movie] else { return }
                MovieController.update(movies: movies)
                self.movies = movies
                self.collectionView?.reloadData()
            } else {
                self.loadLocalMovies()
            }
        })
    }
    
    private func loadUpcomingMovies() {
        MovieController.list(with: .listUpcoming(), completion: { (result, error) in
            if error == nil {
                guard let movies = result as? [Movie] else { return }
                MovieController.update(movies: movies)
                self.movies = movies
                self.collectionView?.reloadData()
            } else {
                self.loadLocalMovies()
            }
        })
    }
    
    func searchMovies(with query: String) {
        MovieController.search(with: query) { (result, error) in
            if error == nil {
                guard let movies = result as? [Movie] else { return }
                self.movies = movies
                self.collectionView?.reloadData()
            } else {
                self.searchLocalMovies(with: query)
            }
        }
    }
    
    //MARK: - Methods
    
    private func loadLocalMovies() {
        MovieController.listMoviesLocally(with: "popularity") { (result, error) in
            if error == nil {
                guard let movies = result as? Results<Movie> else { return }
                self.movies = movies.flatMap{$0}
                self.collectionView?.reloadData()
            }
        }
    }
    
    private func searchLocalMovies(with query: String) {
        MovieController.listMoviesLocally(with: "popularity") { (result, error) in
            if error == nil {
                guard let movies = result as? Results<Movie> else { return }
                self.movies = movies.flatMap{$0}
                self.movies = self.movies.filter({ (movie) -> Bool in
                    return movie.title?.range(of: query) != nil
                })
                self.collectionView?.reloadData()
            }
        }
    }
    
    func openMovieDetail(movieId: String) {
        guard let moviesDetailViewController = UIStoryboard.viewController(withIdentifier: "MoviesDetailViewController") as? MoviesDetailViewController else { return }
        moviesDetailViewController.movieId = movieId
        navigationController?.pushViewController(moviesDetailViewController, animated: true)
    }

}

