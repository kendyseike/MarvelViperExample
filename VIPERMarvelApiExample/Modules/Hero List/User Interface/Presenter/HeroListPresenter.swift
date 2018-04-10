//
//  HeroListPresenter.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

class HeroListPresenter: HeroListPresenterInterface {
    var view: HeroListInterface?
    var interactor: HeroListInteractorInterface?
    var wireFrame: HeroListWireframeInterface?
    
    func prepareForRetrieveHeroList(offset: Int) {
        interactor?.retrieveHeroList(offset: offset)
    }
    
    func showHeroDetailView(hero: Hero) {
        wireFrame?.presentHeroDetailInterface(hero: hero)
    }
    
}

extension HeroListPresenter: HeroListPresenterRetrieveInterface {
    func didRetrieveHeroList(heroes: [Hero]) {
        view?.showHeroList(heroes: heroes)
    }
}
