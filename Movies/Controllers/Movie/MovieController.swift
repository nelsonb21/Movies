//
//  MovieController.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

struct MovieController {
    
    static func list(with movieRouter: MovieRouter, completion: @escaping AppCompletion) {
        Alamofire.request(movieRouter).responseJSON { response in
            var movies: [Movie]?
            if let value = response.result.value as? [String: Any], value["results"] != nil {
                movies = Mapper<Movie>().mapArray(JSONObject: value["results"])
            }
            completion(movies, response.result.error)
        }
    }
    
    static func detail(with id: String, completion: @escaping AppCompletion) {
        Alamofire.request(MovieRouter.movieDetail(id: id)).responseJSON { response in
            var movies: Movie?
            if let value = response.result.value as? [String: Any] {
                movies = Mapper<Movie>().map(JSON: value)
            }
            completion(movies, response.result.error)
        }
    }
    
    static func search(with query: String, completion: @escaping AppCompletion) {
        Alamofire.request(MovieRouter.searchMovie(query: query)).responseJSON { response in
            var movies: [Movie]?
            if let value = response.result.value as? [String: Any], value["results"] != nil {
                movies = Mapper<Movie>().mapArray(JSONObject: value["results"])
            }
            completion(movies, response.result.error)
        }
    }
    
    static func listMoviesLocally(with sortBy: String, completion:AppCompletion) {
        MovieStore.listMovies(with: sortBy, completion: completion)
    }
    
    static func save(movie: Movie) {
        MovieStore.save(movie: movie)
    }
    
    static func update(movie: Movie) {
        MovieStore.update(movie: movie)
    }
    
    static func delete(movie: Movie) {
        MovieStore.delete(movie: movie)
    }
    
    static func deleteAll() {
        MovieStore.deleteAll()
    }
    
}
