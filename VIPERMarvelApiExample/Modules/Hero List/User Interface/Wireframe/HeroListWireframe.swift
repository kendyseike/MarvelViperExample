//
//  HeroListWireframe.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import UIKit

class HeroListWireframe: HeroListWireframeInterface {
    
    var currentController = CurrentController()
    
    class func createHeroListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "HeroNavigationController")
        if let view = navController.childViewControllers.first as? HeroListViewController {
            let presenter: HeroListPresenterInterface & HeroListPresenterRetrieveInterface = HeroListPresenter()
            let interactor: HeroListInteractorInterface & HeroListRemoteManagerRetrieveInterface = HeroListInteractor()
            let remoteDataManager: HeroListRemoteManagerInterface = HeroListRemoteManager()
            let wireFrame: HeroListWireframeInterface = HeroListWireframe()
            
            view.presenter = presenter
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.view = view
            interactor.presenter = presenter
            interactor.remoteManager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentHeroDetailInterface(hero: Hero) {
        let heroDetailViewController = HeroDetailWireframe.createHeroDetailModule(hero: hero)
        currentController.topMostController().show(heroDetailViewController, sender: self)
    }
    
}
