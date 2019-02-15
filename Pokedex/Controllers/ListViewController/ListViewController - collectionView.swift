//
//  ListViewController - collectionView.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension ListViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return validPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Pokemon", for: indexPath) as! PokemonCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.pokemonName.text = validPokemon[indexPath[1]].name
        do {
            if let url = URL(string: validPokemon[indexPath[1]].imageUrl) {
                let data = try Data(contentsOf: url)
                cell.pokemonImage.image = UIImage(data: data)
            }
            //let data = try Data(contentsOf: url!)
            //cell.pokemonImage.image = UIImage(data: data)
        } catch {
            print(error)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPokemon = validPokemon[indexPath[1]]
        performSegue(withIdentifier: "toProfile", sender: self)
    }
}
