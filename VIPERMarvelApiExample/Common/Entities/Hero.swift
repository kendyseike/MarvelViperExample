//
//  HeroList.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import ObjectMapper

class Hero: Mappable {
    var id: String?
    var name: String?
    var description: String?
    var thumbnailPath: String?
    var thumbnailExtension: String?
    var image: UIImage?
    var comicsCount: Int?
    var storiesCount: Int?
    var eventsCount: Int?
    var seriesCount: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnailPath <- map["thumbnail.path"]
        thumbnailExtension <- map["thumbnail.extension"]
        comicsCount <- map["comics.available"]
        storiesCount <- map["stories.available"]
        eventsCount <- map["events.available"]
        seriesCount <- map["series.available"]
    }
}
