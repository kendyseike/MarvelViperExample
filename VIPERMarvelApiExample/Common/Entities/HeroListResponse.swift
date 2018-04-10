//
//  HeroListResponse.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import ObjectMapper

class HeroListResponse: Mappable {
    var copyright: String?
    var results: [Hero]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        copyright <- map["copyright"]
        results <- map["data.results"]
    }
}
