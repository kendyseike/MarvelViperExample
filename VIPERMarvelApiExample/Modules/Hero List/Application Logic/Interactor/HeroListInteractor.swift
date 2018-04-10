//
//  HeroListInteractor.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

class HeroListInteractor: HeroListInteractorInterface {
    var remoteManager: HeroListRemoteManagerInterface?
    var interactorHandler: HeroListInteractorInterface?
    var presenter: HeroListPresenterRetrieveInterface?
    
    func retrieveHeroList(offset: Int) {
        /*
         do {
         //TODO: verificação se existe algum cache
         if let movies = try localDataManager?.retrieveHeroList() {
         
         }else {
            remoteRetrieveHandler?.retrieve()
         }
         
         } catch {
            interactorHandler?.onError()
         }
         
         */
        
        remoteManager?.retrieveHeroList(offset: offset)
    }
}

extension HeroListInteractor: HeroListRemoteManagerRetrieveInterface {
    func onHeroListRetrieve(_heroes: [Hero]) {
        presenter?.didRetrieveHeroList(heroes: _heroes)
    }
    
    func onError() {
        
    }
}
