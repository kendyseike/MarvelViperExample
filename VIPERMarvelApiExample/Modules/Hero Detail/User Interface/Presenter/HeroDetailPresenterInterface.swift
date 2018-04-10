//
//  HeroDetailPresenterInterface.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

protocol HeroDetailPresenterInterface: class {
    var hero: Hero! { get set }
    var view: HeroDetailInterface? { get set }
    var wireFrame: HeroListWireframeInterface? { get set }
    
    func prepareForRetrieveHeroDetail()
}
