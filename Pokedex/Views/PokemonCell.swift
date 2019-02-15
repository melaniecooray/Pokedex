//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/13/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class PokemonCell : UICollectionViewCell {
    var pokemonName : UILabel!
    var pokemonImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonName = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 20))
        pokemonName.center = CGPoint(x: contentView.frame.width/2, y: contentView.frame.height - 10)
        pokemonName.font = UIFont(name: "Copperplate", size: 15)
        pokemonName.textAlignment = .center
        contentView.addSubview(pokemonName)
        
        pokemonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width - 50, height: contentView.frame.height - 50))
        pokemonImage.center = CGPoint(x: contentView.frame.width/2, y: (contentView.frame.height/2) - 10)
        contentView.addSubview(pokemonImage)
    }
}
