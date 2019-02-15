//
//  CategoryCell.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/10/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class CategoryCell : UICollectionViewCell {
    var categoryName : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryName = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height))
        categoryName.font = UIFont(name: "Copperplate", size: 15)
        categoryName.textColor = .white
        categoryName.center = CGPoint(x: contentView.frame.width/2, y: contentView.frame.height/2)
        categoryName.textAlignment = .center
        contentView.addSubview(categoryName)
    }
}
