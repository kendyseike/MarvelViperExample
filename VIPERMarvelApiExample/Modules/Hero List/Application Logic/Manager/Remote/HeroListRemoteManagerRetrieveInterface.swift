//
//  HeroListRemoteManagerRetrieveInterface.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import Foundation

protocol HeroListRemoteManagerRetrieveInterface {
    func onError()
    func onHeroListRetrieve(_heroes: [Hero])
}
