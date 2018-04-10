//
//  ViewController.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 08/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import UIKit

class HeroListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableHeroList: UITableView!
    
    var presenter: HeroListPresenterInterface?
    var heroList: [Hero] = []
    var heightOfTableViewConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        configureView()
        presenter?.prepareForRetrieveHeroList(offset: heroList.count+10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableHeroList.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tableHeroList.removeObserver(self, forKeyPath: "contentSize")
    }
    
    //MARK: View Configuration
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if (keyPath == "contentSize") {
            if let newvalue = change?[.newKey]{
                let newsize  = newvalue as! CGSize
                self.heightOfTableViewConstraint?.constant = newsize.height
            }
        }
    }
    
    func configureView() {
        tableHeroList.estimatedRowHeight = 0
        tableHeroList.estimatedSectionHeaderHeight = 0
        tableHeroList.estimatedSectionFooterHeight = 0
        
        heightOfTableViewConstraint = NSLayoutConstraint(item: tableHeroList, attribute: .height, relatedBy: .equal, toItem: tableHeroList.superview, attribute: .height, multiplier: 0.0, constant: 1000)
        tableHeroList.superview?.addConstraint(heightOfTableViewConstraint!)
        
        navigationItem.title = "Marvel"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: TableView Delegate/Datasource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let heroListCell : HeroListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HeroListTableViewCell", for: indexPath) as! HeroListTableViewCell
        
        let heroDetail: Hero = heroList[indexPath.row]
        heroListCell.setup(_hero: heroDetail)
        
        return heroListCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showHeroDetailView(hero: heroList[indexPath.row])
    }

}

extension HeroListViewController: HeroListInterface {
    func showHeroList(heroes: [Hero]) {
        heroList = heroes
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.tableHeroList.reloadData()
        })
    }
}

