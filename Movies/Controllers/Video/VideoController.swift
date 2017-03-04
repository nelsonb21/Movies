//
//  VideoController.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

struct VideoController {
    
    static func getVideos(with movieId: String, completion: @escaping AppCompletion) {
        Alamofire.request(VideoRouter.getVideos(movieId: movieId)).responseJSON { response in
            var videos: [Video]?
            if let value = response.result.value as? [String: Any], value["results"] != nil {
                videos = Mapper<Video>().mapArray(JSONObject: value["results"])
            }
            completion(videos, response.result.error)
        }
    }

}
