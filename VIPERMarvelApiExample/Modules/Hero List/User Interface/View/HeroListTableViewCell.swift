//
//  HeroListTableViewCell.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import UIKit

class HeroListTableViewCell: UITableViewCell {
    @IBOutlet weak var viewHeroCellContent: UIView!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    func setup(_hero: Hero) {
        heroNameLabel.text = _hero.name
        heroImageView.image = _hero.image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewHeroCellContent.layer.cornerRadius = 5
        viewHeroCellContent.layer.borderWidth = 1
        viewHeroCellContent.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.x += 10
            frame.size.width -= 2 * 10
            frame.origin.y += 10
            frame.size.height -= 2 * 5
            super.frame = frame
        }
    }

}
