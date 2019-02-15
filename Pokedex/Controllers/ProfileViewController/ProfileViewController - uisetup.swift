//
//  ProfileViewController - uisetup.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension ProfileViewController {
    func loadImage() {
        pokemonImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.width/2))
        pokemonImage.center = CGPoint(x: view.frame.width/3, y: 300)
        
        do {
            if let url = URL(string: pokemon.imageUrl) {
                let data = try Data(contentsOf: url)
                pokemonImage.image = UIImage(data: data)
            }
            //let data = try Data(contentsOf: url!)
            //cell.pokemonImage.image = UIImage(data: data)
        } catch {
            print(error)
        }
        view.addSubview(pokemonImage)
    }
    
    func displayImportantStats() {
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        nameLabel.center = CGPoint(x: view.frame.width/2, y: 150)
        nameLabel.text = "\(pokemon.name!)"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "Copperplate-Bold", size: 50)
        attackLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        attackLabel.center = CGPoint(x: pokemonImage.frame.maxX + 80, y: 250)
        attackLabel.text = "Attack: \(pokemon.attack!)"
        attackLabel.font = UIFont(name: "Copperplate", size: 20)
        attackLabel.textAlignment = .center
        defenseLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        defenseLabel.center = CGPoint(x: pokemonImage.frame.maxX + 80, y: 300)
        defenseLabel.text = "Defense: \(pokemon.defense!)"
        defenseLabel.font = UIFont(name: "Copperplate", size: 20)
        defenseLabel.textAlignment = .center
        healthLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        healthLabel.center = CGPoint(x: pokemonImage.frame.maxX + 80, y: 350)
        healthLabel.text = "Health: \(pokemon.health!)"
        healthLabel.font = UIFont(name: "Copperplate", size: 20)
        healthLabel.textAlignment = .center
        view.addSubview(nameLabel)
        view.addSubview(attackLabel)
        view.addSubview(defenseLabel)
        view.addSubview(healthLabel)
    }
    
    func displayOtherStats() {
        specialAttackLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        specialAttackLabel.center = CGPoint(x: view.frame.width/2, y: 450)
        specialAttackLabel.text = "Special Attack: \(pokemon.specialAttack!)"
        specialAttackLabel.font = UIFont(name: "Copperplate", size: 25)
        specialAttackLabel.textAlignment = .center
        specialDefenseLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        specialDefenseLabel.center = CGPoint(x: view.frame.width/2, y: 500)
        specialDefenseLabel.text = "Special Defense: \(pokemon.specialDefense!)"
        specialDefenseLabel.font = UIFont(name: "Copperplate", size: 25)
        specialDefenseLabel.textAlignment = .center
        speciesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        speciesLabel.center = CGPoint(x: view.frame.width/2, y: 550)
        speciesLabel.text = "Species: \(pokemon.species!)"
        speciesLabel.font = UIFont(name: "Copperplate", size: 20)
        speciesLabel.textAlignment = .center
        speedLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        speedLabel.center = CGPoint(x: view.frame.width/2, y: 600)
        speedLabel.text = "Speed: \(pokemon.speed!)"
        speedLabel.font = UIFont(name: "Copperplate", size: 25)
        speedLabel.textAlignment = .center
        totalLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        totalLabel.center = CGPoint(x: view.frame.width/2, y: 650)
        totalLabel.text = "Total: \(pokemon.total!)"
        totalLabel.font = UIFont(name: "Copperplate", size: 25)
        totalLabel.textAlignment = .center
        view.addSubview(specialAttackLabel)
        view.addSubview(specialDefenseLabel)
        view.addSubview(speciesLabel)
        view.addSubview(speedLabel)
        view.addSubview(totalLabel)
    }
    
    func searchOnWebButton() {
        webButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/2 - 15, height: 50))
        webButton.center = CGPoint(x: view.frame.width/4, y: view.frame.height - 100)
        webButton.layer.cornerRadius = 15
        webButton.setTitle("Search Online", for: .normal)
        webButton.backgroundColor = .red
        webButton.addTarget(self, action: #selector(goToWeb), for: .touchUpInside)
        view.addSubview(webButton)
    }
    
    func displayFavoriteButton() {
        favoritesButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/2 - 15, height: 50))
        favoritesButton.center = CGPoint(x: (view.frame.width/4) * 3, y: view.frame.height - 100)
        favoritesButton.layer.cornerRadius = 15
        favoritesButton.setTitle("Go to Favorites", for: .normal)
        favoritesButton.backgroundColor = .red
        favoritesButton.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
        view.addSubview(favoritesButton)
    }
    
    func setupFavoritesIcon() {
        let heartImage = UIImage(named: "emptyheart")
        heartButton = UIBarButtonItem(image: heartImage, style: .plain, target: self, action: #selector(favoritesIcon))
        self.navigationItem.rightBarButtonItem = heartButton
    }
}
