//
//  HeroListPresenterInterface.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

protocol HeroListPresenterInterface: class {
    var view: HeroListInterface? { get set }
    var interactor: HeroListInteractorInterface? { get set }
    var wireFrame: HeroListWireframeInterface? { get set }
    
    func prepareForRetrieveHeroList(offset: Int)
    func showHeroDetailView(hero: Hero)
}
