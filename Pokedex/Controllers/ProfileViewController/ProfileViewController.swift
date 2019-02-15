//
//  ProfileViewController.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/10/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var pokemon : Pokemon!
    
    var pokemonImage : UIImageView!
    
    var nameLabel : UILabel!
    var attackLabel : UILabel!
    var defenseLabel : UILabel!
    var healthLabel : UILabel!
    var specialAttackLabel : UILabel!
    var specialDefenseLabel : UILabel!
    var speciesLabel : UILabel!
    var speedLabel : UILabel!
    var totalLabel : UILabel!
    var typesLabel : UILabel!
    
    var webButton : UIButton!
    
    var favoritesButton : UIButton!
    var heartButton : UIBarButtonItem!
    var heartIcon : UIImage!
    var favorite = false
    var favorites : [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bluebackground.png")!)
        loadImage()
        displayImportantStats()
        searchOnWebButton()
        setupFavoritesIcon()
        displayFavoriteButton()
        displayOtherStats()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let rootVC = self.navigationController!.viewControllers[1] as? ListViewController {
            rootVC.favoritePokemon = favorites
        } else if let rootVC = self.navigationController!.viewControllers[0] as? SearchViewController{
            rootVC.favorites = favorites
        }
    }
    
    @objc func goToWeb() {
        UIApplication.shared.open(URL(string: "https://google.com/search?q=\(pokemon.name!)") ?? URL(string: "www.google.com")!, options: [:], completionHandler: nil)
    }
    
    @objc func favoriteButtonClicked() {
        performSegue(withIdentifier: "toFavorites", sender: self)
    }
    
    @objc func favoritesIcon() {
        favorite = !favorite
        if favorite {
            heartIcon = UIImage(named: "heart")
            var no = false
            for i in 0..<favorites.count {
                if favorites[i].name == pokemon.name {
                    no = true
                }
            }
            if !no {
                favorites.append(pokemon)
            }
        } else {
            heartIcon = UIImage(named: "emptyheart")
            for i in 0..<favorites.count {
                if favorites[i].name == pokemon.name {
                    favorites.remove(at: i)
                    break
                }
            }
        }
        self.navigationItem.rightBarButtonItem?.image = heartIcon.withRenderingMode(.alwaysOriginal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? FavoriteViewController {
            resultVC.pokemon = favorites
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
