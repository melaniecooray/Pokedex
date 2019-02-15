//
//  SearchViewController - uisetup.swift
//  Pokedex
//
//  Created by Melanie Cooray on 2/14/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

extension SearchViewController {
    func displayTitle() {
        pokedexTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        pokedexTitle.center = CGPoint(x: view.frame.width/2, y: 150)
        pokedexTitle.text = "Pokedex"
        pokedexTitle.font = UIFont(name: "Copperplate-Bold", size: 60)
        pokedexTitle.textColor = .black
        pokedexTitle.textAlignment = .center
        view.addSubview(pokedexTitle)
    }
    
    func displayRandomButton() {
        randomButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: 50))
        randomButton.center = CGPoint(x: view.frame.width/4, y: 800)
        randomButton.setTitle("Random", for: .normal)
        randomButton.layer.cornerRadius = 15
        randomButton.backgroundColor = .red
        randomButton.addTarget(self, action: #selector(randomButtonClicked), for: .touchUpInside)
        view.addSubview(randomButton)
    }
    
    func displaySearchButton() {
        searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: 50))
        searchButton.center = CGPoint(x: (view.frame.width/4) * 3, y: 800)
        searchButton.setTitle("Search", for: .normal)
        searchButton.layer.cornerRadius = 15
        searchButton.backgroundColor = .red
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        view.addSubview(searchButton)
    }
    
    func displayCategories() {
        //let collectionView = UICollectionView(frame: CGRect(x: 0, y: 300, width: 300, height: 400))
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width/3, height: 100)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0;
        collectionView = UICollectionView(frame: CGRect(x: 0, y: pokedexTitle.frame.maxY + 50, width: view.frame.width, height: 300), collectionViewLayout: layout)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "Category")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    func displaySearchBar() {
        searchBar = UITextField(frame: CGRect(x: 0, y: 40, width: view.frame.width, height: 50))
        searchBar.placeholder = "Search for a specific Pokemon"
        searchBar.font = UIFont.systemFont(ofSize: 20)
        searchBar.borderStyle = UITextField.BorderStyle.roundedRect
        searchBar.autocorrectionType = UITextAutocorrectionType.no
        searchBar.keyboardType = UIKeyboardType.default
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.clearButtonMode = UITextField.ViewMode.whileEditing
        searchBar.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        searchBar.delegate = self
        view.addSubview(searchBar)
    }
    
    func displayAttackSlider() {
        attackLabel = UILabel(frame: CGRect(x: 10, y: collectionView.frame.maxY + 50, width: 90, height: 20))
        attackLabel.text = "Attack:"
        attackLabel.font = UIFont(name: "Copperplate", size: 18)
        attackSlider = UISlider(frame: CGRect(x: 100, y: collectionView.frame.maxY + 50, width: 250, height: 20))
        attackSlider.minimumValue = 0
        attackSlider.maximumValue = 100
        attackSlider.isContinuous = true
        attackSlider.tintColor = .green
        attackSlider.addTarget(self, action: #selector(attackValueChanged), for: .valueChanged)
        attackCountLabel = UILabel(frame: CGRect(x: attackSlider.frame.maxX + 20, y: collectionView.frame.maxY + 50, width: 30, height: 20))
        attackCountLabel.text = "\(attackCount)"
        view.addSubview(attackSlider)
        view.addSubview(attackLabel)
        view.addSubview(attackCountLabel)
    }
    
    func displayDefenseSlider() {
        defenseLabel = UILabel(frame: CGRect(x: 10, y: attackLabel.frame.maxY + 50, width: 90, height: 20))
        defenseLabel.text = "Defense:"
        defenseLabel.font = UIFont(name: "Copperplate", size: 18)
        defenseSlider = UISlider(frame: CGRect(x: 100, y: attackSlider.frame.maxY + 50, width: 250, height: 20))
        defenseSlider.minimumValue = 0
        defenseSlider.maximumValue = 100
        defenseSlider.isContinuous = true
        defenseSlider.tintColor = .green
        defenseSlider.addTarget(self, action: #selector(defenseValueChanged), for: .valueChanged)
        defenseCountLabel = UILabel(frame: CGRect(x: defenseSlider.frame.maxX + 20, y: attackSlider.frame.maxY + 50, width: 30, height: 20))
        defenseCountLabel.text = "\(defenseCount)"
        view.addSubview(defenseSlider)
        view.addSubview(defenseLabel)
        view.addSubview(defenseCountLabel)
    }
    
    func displayHealthSlider() {
        healthLabel = UILabel(frame: CGRect(x: 10, y: defenseLabel.frame.maxY + 50, width: 90, height: 20))
        healthLabel.text = "Health:"
        healthLabel.font = UIFont(name: "Copperplate", size: 18)
        healthSlider = UISlider(frame: CGRect(x: 100, y: defenseSlider.frame.maxY + 50, width: 250, height: 20))
        healthSlider.minimumValue = 0
        healthSlider.maximumValue = 100
        healthSlider.isContinuous = true
        healthSlider.tintColor = .green
        healthSlider.addTarget(self, action: #selector(healthValueChanged), for: .valueChanged)
        healthCountLabel = UILabel(frame: CGRect(x: healthSlider.frame.maxX + 20, y: defenseSlider.frame.maxY + 50, width: 30, height: 20))
        healthCountLabel.text = "\(healthCount)"
        view.addSubview(healthSlider)
        view.addSubview(healthLabel)
        view.addSubview(healthCountLabel)
    }
}
