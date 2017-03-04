//
//  Video.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import ObjectMapper
import Realm
import RealmSwift

class Video: Object, Mappable {
    
    var id: String?
    dynamic var name: String?
    dynamic var videoKey: String?
    
    //MARK: - Init
    
    required init() {
        super.init()
    }
    
    //MARK: - Mappable
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        videoKey <- map["key"]
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
