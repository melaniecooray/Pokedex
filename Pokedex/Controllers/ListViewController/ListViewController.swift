//
//  ListViewController.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/10/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    
    var random = true
    var minAttack = 0
    var minDefense = 0
    var minHealth = 0
    var categories : [String] = []
    var pokemon : [Pokemon] = []
    var validPokemon : [Pokemon] = []
    var favoritePokemon : [Pokemon] = []
    var selectedPokemon : Pokemon!
    var chosenIndices : [Int] = []
    var collectionView : UICollectionView!
    var tableView : UITableView!
    var customSC : UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ProfileViewController {
            resultVC.pokemon = selectedPokemon
            resultVC.favorites = favoritePokemon
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadPokemon()
        setupSegmentedControl()
        //displayCategories()
        if random {
            randomPokemon()
        } else {
            filterPokemon()
        }
        displayCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
    }
    
    func loadPokemon() {
        pokemon = PokemonGenerator.getPokemonArray()
    }
    
    func filterPokemon() {
        for poke in pokemon {
            if !(poke.attack < minAttack || poke.defense < minDefense || poke.health < minHealth) {
                for type in poke.types {
                    for category in categories {
                        if type == category {
                            for pokemon in validPokemon {
                                if pokemon.name == poke.name {
                                    continue
                                }
                            }
                            validPokemon.append(poke)
                        }
                    }
                }
            }
        }
    }
    
    func randomPokemon () {
        var i = 0
        while i < 20 {
            let rand = arc4random_uniform(UInt32(pokemon.count))
            var found = 0
            for index in chosenIndices {
                if index == Int(rand) {
                    found = 1
                }
            }
            if found == 0 {
                validPokemon.append(pokemon[Int(rand)])
                i += 1
            }
        }
    }
    
    @objc func indexChanged(_ sender: Any) {
        switch customSC.selectedSegmentIndex {
        case 0 : displayCategories()
        case 1: displayList()
        default: break
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
