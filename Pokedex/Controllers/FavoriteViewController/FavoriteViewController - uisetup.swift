//
//  FavoriteViewController - uisetup.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension FavoriteViewController {
    func displayList() {
        tableView = UITableView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height))
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: "PokemonList")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
}
