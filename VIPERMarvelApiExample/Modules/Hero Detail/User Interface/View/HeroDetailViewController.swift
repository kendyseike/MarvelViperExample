//
//  HeroDetailViewController.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {
    @IBOutlet weak var heroDescriptionLabel: UILabel!
    @IBOutlet weak var comicsView: UIView!
    @IBOutlet weak var comicsCountLabel: UILabel!
    @IBOutlet weak var storiesView: UIView!
    @IBOutlet weak var storiesCountLabel: UILabel!
    @IBOutlet weak var eventsView: UIView!
    @IBOutlet weak var eventsCountLabel: UILabel!
    @IBOutlet weak var seriesView: UIView!
    @IBOutlet weak var seriesCountLabel: UILabel!
    
    var presenter: HeroDetailPresenterInterface?
    var heroDetail: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.prepareForRetrieveHeroDetail()
        
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: View Configuration
    
    func configureView() {
        //TODO: IBInspectable to change values from Storyboard
        comicsView.layer.cornerRadius = 5
        storiesView.layer.cornerRadius = 5
        eventsView.layer.cornerRadius = 5
        seriesView.layer.cornerRadius = 5
        
        heroDescriptionLabel.text = heroDetail?.description != "" ? heroDetail?.description : "Nenhuma descrição disponível"
        comicsCountLabel.text = heroDetail?.comicsCount.flatMap { String($0) }
        storiesCountLabel.text = heroDetail?.storiesCount.flatMap { String($0) }
        eventsCountLabel.text = heroDetail?.eventsCount.flatMap { String($0) }
        seriesCountLabel.text = heroDetail?.seriesCount.flatMap { String($0) }
        
        navigationItem.title = heroDetail?.name
        
    }
    
}

extension HeroDetailViewController: HeroDetailInterface {
    func showHeroDetail(hero: Hero) {
        heroDetail = hero
    }
}
