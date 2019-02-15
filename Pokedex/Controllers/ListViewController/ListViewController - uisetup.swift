//
//  ListViewController - uisetup.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension ListViewController {
    func setupSegmentedControl() {
        let items = ["Grid", "List"]
        customSC = UISegmentedControl(items: items)
        customSC.frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        customSC.center = CGPoint(x: view.frame.width/2, y: 125)
        customSC.selectedSegmentIndex = 0
        
        customSC.layer.cornerRadius = 5;
        self.navigationItem.titleView = customSC
        customSC.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        //view.addSubview(customSC)
        //view.bringSubviewToFront(customSC)
    }
    
    func displayCategories() {
        //let collectionView = UICollectionView(frame: CGRect(x: 0, y: 300, width: 300, height: 400))
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width/3, height: view.frame.width/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0;
        collectionView = UICollectionView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: "Pokemon")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    func displayList() {
        tableView = UITableView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height))
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: "PokemonList")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
    
}
