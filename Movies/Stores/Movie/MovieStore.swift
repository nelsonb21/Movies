//
//  MovieStore.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import RealmSwift

struct MovieStore {
    
    static let realm = try! Realm()
    
    static func save(movie: Movie) {
        try! realm.write {
            realm.add(movie)
        }
    }
    
    static func save(movies: [Movie]) {
        try! realm.write {
            movies.forEach { (movie) in
                realm.add(movie)
            }
        }
    }
    
    static func update(movie: Movie) {
        try! realm.write {
            realm.add(movie, update: true)
        }
    }
    
    static func delete(movie: Movie) {
        try! realm.write {
            realm.delete(movie)
        }
    }
    
    static func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    static func listMovies(with sortBy: String, completion: AppCompletion) {
        completion(realm.objects(Movie.self).sorted(byKeyPath: sortBy, ascending: true), nil)
    }
    
    static func show(movie: Movie) -> Movie? {
        return realm.object(ofType: Movie.self, forPrimaryKey: movie.id.value)
    }
    
}
