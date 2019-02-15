//
//  ViewController.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/10/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    var buttonClicked = ""
    
    var pokedexTitle : UILabel!
    var randomButton : UIButton!
    var searchButton : UIButton!
    var collectionView : UICollectionView!
    var searchBar : UITextField!
    var searchEntry = ""
    var searched = false
    var selectedPokemon : Pokemon!
    var pokemon : [Pokemon] = []
    var favorites : [Pokemon] = []
    
    var attackSlider : UISlider!
    var attackLabel : UILabel!
    var attackCountLabel : UILabel!
    var attackCount = 0
    
    var healthSlider : UISlider!
    var healthLabel : UILabel!
    var healthCountLabel : UILabel!
    var healthCount = 0
    
    var defenseSlider : UISlider!
    var defenseLabel : UILabel!
    var defenseCountLabel : UILabel!
    var defenseCount = 0
    
    var categories  = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    //var categoryColors : [UIColor] = [UIColor(red: 0, green: 0, blue: 139/255, alpha: 0.75), UIColor(red: 0, green: 128/255, blue: 0, alpha: 0.75), UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.75), UIColor(red: 47/255, green: 79/255, blue: 79/255, alpha: 0.75), UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 0.75), UIColor(red: 176/255, green: 224/255, blue: 230/255, alpha: 0.75), UIColor(red: 1, green: 1, blue: 0, alpha: 0.75), UIColor(red: 0, green: 0, blue: 245/255, alpha: 0.75), UIColor(red: 1, green: 192/255, blue: 203/255, alpha: 0.75), UIColor(red: 0, green: 100/255, blue: 0, alpha: 0.75), UIColor(red: 139/255, green: 0, blue: 0, alpha: 0.75), UIColor(red: 218/255, green: 112/255, blue: 214/255, alpha: 0.75), UIColor(red: 1, green: 0, blue: 0, alpha: 0.75), UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 0.75), UIColor(red: 0, green: 0, blue: 1, alpha: 0.75), UIColor(red: 105/255, green: 105/255, blue: 105/255, alpha: 0.75), UIColor(red: 1, green: 1, blue: 1, alpha: 0.75), UIColor(red: 0, green: 191/255, blue: 1, alpha: 0.75)]
    var categoryImages : [UIImage] = [UIImage(named: "bug")!, UIImage(named: "grass")!, UIImage(named: "dark")!, UIImage(named: "ground")!, UIImage(named: "dragon")!, UIImage(named: "ice")!, UIImage(named: "electric")!, UIImage(named: "normal")!, UIImage(named: "fairy")!, UIImage(named: "poison")!, UIImage(named: "fighting")!, UIImage(named: "psychic")!, UIImage(named: "fire")!, UIImage(named: "rock")!, UIImage(named: "flying")!, UIImage(named: "steel")!, UIImage(named: "ghost")!, UIImage(named: "water")!]
    var selectedCategories : [String] = []
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        searchEntry = (textField.text)!
        findPokemon()
        searched = true
        //textField.resignFirstResponder()
        performSegue(withIdentifier: "toSearchProfile", sender: self)
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bluebackground.png")!)
        displayTitle()
        displayRandomButton()
        displaySearchButton()
        displayCategories()
        displaySearchBar()
        displayAttackSlider()
        displayDefenseSlider()
        displayHealthSlider()
        loadPokemon()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = true
    }
    
    @objc func randomButtonClicked() {
        buttonClicked = "random"
        performSegue(withIdentifier: "toList", sender: self)
    }
    
    @objc func searchButtonClicked() {
        buttonClicked = "search"
        performSegue(withIdentifier: "toList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ListViewController {
            if buttonClicked == "search" {
                resultVC.minAttack = attackCount
                resultVC.minDefense = defenseCount
                resultVC.minHealth = healthCount
                resultVC.categories = selectedCategories
                resultVC.random = false
            }
            resultVC.favoritePokemon = favorites
        } else if let resultVC = segue.destination as? ProfileViewController {
            resultVC.pokemon = selectedPokemon
            resultVC.favorites = favorites
        }
    }
    
    func loadPokemon() {
        pokemon = PokemonGenerator.getPokemonArray()
    }
    
    func findPokemon() {
        for poke in pokemon {
            if poke.name == searchEntry {
                selectedPokemon = poke
            }
            if String(poke.number) == searchEntry {
                selectedPokemon = poke
            }
        }
    }
    
    @objc func attackValueChanged(_ sender : UISlider!) {
        attackCount = Int(sender.value)
        attackCountLabel.text = "\(attackCount)"
    }
    
    @objc func defenseValueChanged(_ sender : UISlider!) {
        defenseCount = Int(sender.value)
        defenseCountLabel.text = "\(defenseCount)"
    }
    
    @objc func healthValueChanged(_ sender : UISlider!) {
        healthCount = Int(sender.value)
        healthCountLabel.text = "\(healthCount)"
    }
    

}

