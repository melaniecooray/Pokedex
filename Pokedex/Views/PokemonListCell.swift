//
//  PokemonListCell.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class PokemonListCell : UITableViewCell {
    
    var pokemonImage : UIImageView!
    var pokemonName : UILabel!
    var pokemonNumber : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonNumber = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: contentView.frame.height))
        pokemonNumber.center = CGPoint(x: 75, y: contentView.frame.height/2)
        pokemonNumber.font = UIFont(name: "Copperplate", size: 15)
        contentView.addSubview(pokemonNumber)
        
        pokemonName = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: contentView.frame.height))
        pokemonName.center = CGPoint(x: 230, y: contentView.frame.height/2)
        pokemonName.font = UIFont(name: "Copperplate", size: 15)
        contentView.addSubview(pokemonName)
        
        pokemonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.height, height: contentView.frame.height))
        pokemonImage.center = CGPoint(x: 350, y: contentView.frame.height/2)
        contentView.addSubview(pokemonImage)
    }
    
}
