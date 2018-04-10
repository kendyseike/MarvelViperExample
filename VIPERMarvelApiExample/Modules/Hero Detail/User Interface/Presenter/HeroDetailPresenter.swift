//
//  HeroDetailPresenter.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

class HeroDetailPresenter: HeroDetailPresenterInterface {
    var hero: Hero!
    var view: HeroDetailInterface?
    var wireFrame: HeroListWireframeInterface?
    
    func prepareForRetrieveHeroDetail() {
        view?.showHeroDetail(hero: hero)
    }
}

extension HeroDetailPresenter: HeroDetailPresenterRetrieveInterface {
    func didRetrieveHeroDetail(hero: Hero) {
        view?.showHeroDetail(hero: hero)
    }
}
