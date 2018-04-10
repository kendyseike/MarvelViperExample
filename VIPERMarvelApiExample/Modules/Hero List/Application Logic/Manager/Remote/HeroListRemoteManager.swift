//
//  HeroListRemoteManager.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import AlamofireImage

class HeroListRemoteManager: HeroListRemoteManagerInterface {
    var remoteRequestHandler: HeroListRemoteManagerRetrieveInterface?
    
    func retrieveHeroList(offset: Int) {
        Alamofire.request("https://gateway.marvel.com:443/v1/public/characters", parameters: [
            "limit" : String(10),
            "offset" : String(offset),
            "apikey": "5bc9618db2eddd9485354410609a3157",
            "ts": "1",
            "hash": "1df32f68bcca4465cfc819f4921ae3af"
            ]).responseObject { (response: DataResponse<HeroListResponse>) in
                let heroListResponse = response.result.value
                var heroList : [Hero] = []
                
                if let heroListResponseArray = heroListResponse?.results {
                    for hero in heroListResponseArray {
                        let URL : String! = "\(hero.thumbnailPath!).\(hero.thumbnailExtension!)"
                        Alamofire.request(URL).responseImage { response in
                            if let image = response.result.value {
                                hero.image = image
                                heroList.append(hero)
                                
                                self.remoteRequestHandler?.onHeroListRetrieve(_heroes: heroList)
                            }
                        }
                    }
                }else {
                    self.remoteRequestHandler?.onError()
                }
        }
    }
}
