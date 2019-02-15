//
//  ListViewController - tableView.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return validPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonList", for: indexPath) as! PokemonListCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.pokemonName.text = validPokemon[indexPath[1]].name
        cell.pokemonNumber.text = "#\(validPokemon[indexPath[1]].number!)"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPokemon = validPokemon[indexPath[1]]
        performSegue(withIdentifier: "toProfile", sender: self)
    }
}
