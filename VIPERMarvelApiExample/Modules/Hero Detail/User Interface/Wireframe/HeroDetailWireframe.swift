//
//  HeroDetailWireframe.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import UIKit

class HeroDetailWireframe {
    
    class func createHeroDetailModule(hero: Hero) -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "HeroDetailViewController") as? HeroDetailViewController {
            let presenter: HeroDetailPresenterInterface & HeroDetailPresenterRetrieveInterface = HeroDetailPresenter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.hero = hero
            
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
