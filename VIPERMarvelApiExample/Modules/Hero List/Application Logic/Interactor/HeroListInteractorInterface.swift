//
//  HeroListInteractorInterface.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import Foundation

protocol HeroListInteractorInterface: class {
    var remoteManager: HeroListRemoteManagerInterface? { get set }
    var presenter: HeroListPresenterRetrieveInterface? { get set }
    
    func retrieveHeroList(offset: Int)
    func onError()
}
