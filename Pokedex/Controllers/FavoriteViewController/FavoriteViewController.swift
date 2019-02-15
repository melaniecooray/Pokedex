//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var pokemon : [Pokemon] = []
    var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayList()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let rootVC = self.navigationController!.viewControllers[1] as? ProfileViewController {
            rootVC.favorites = pokemon
        } else if let rootVC = self.navigationController!.viewControllers[2] as? ProfileViewController {
            rootVC.favorites = pokemon
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
