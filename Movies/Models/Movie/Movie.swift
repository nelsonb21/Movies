//
//  Movie.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import ObjectMapper
import Realm
import RealmSwift

class Movie: Object, Mappable {
    
    let id =  RealmOptional<Int>()
    dynamic var title: String?
    dynamic var posterPath: String?
    dynamic var overview: String?
    dynamic var releaseDate: String?
    dynamic var originalLanguage: String?
    var adult = RealmOptional<Bool>()
    var popularity = RealmOptional<Double>()
    var hasVideo = RealmOptional<Bool>()
    var voteAverage = RealmOptional<Double>()
    //dynamic var videoPath: String?
    
    //MARK: - Init
    
    required init() {
        super.init()
    }
    
    //MARK: - Mappable
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id.value <- map["id"]
        title <- map["title"]
        posterPath <- map["poster_path"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        originalLanguage <- map["original_language"]
        adult.value <- map["adult"]
        popularity.value <- map["popularity"]
        hasVideo.value <- map["video"]
        voteAverage.value <- map["vote_average"]
    }

    
    //MARK: - Realm
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
}
