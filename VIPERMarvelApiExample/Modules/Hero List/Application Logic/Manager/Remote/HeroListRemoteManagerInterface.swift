//
//  HeroListRemoteManagerInterface.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import Foundation

protocol HeroListRemoteManagerInterface: class {
    var remoteRequestHandler: HeroListRemoteManagerRetrieveInterface? { get set }
    
    func retrieveHeroList(offset:Int)
}
