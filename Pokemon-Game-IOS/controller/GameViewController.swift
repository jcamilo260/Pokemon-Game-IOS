//
//  GameViewController.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation
import UIKit

class GameViewController: UIViewController{
    
    private var gameView: UIGameView = UIGameView()
    private lazy var pokemonManager: PokemonManager = PokemonManager()
    private lazy var imageManager: ImageManager = ImageManager()
    private var pokemons: [PokemonDTO] = []
    /*private let button: UIGameButton = {
        let theButton: UIGameButton = UIGameButton()
        theButton.setTitle("OLAAA", for: .normal)
        theButton.setTitleColor(.black, for: .normal)
        theButton.translatesAutoresizingMaskIntoConstraints = false
        theButton.titleLabel?.adjustsFontSizeToFitWidth = true
        theButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return theButton
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Datasource.Colors.gameBackground
        self.setupUIGameView()
        self.pokemonManager.delegate = self
        self.imageManager.delegate = self
        self.pokemonManager.fetchRequest()
    }
    
    private func setupUIGameView(){
        self.view.addSubview(self.gameView)
        self.gameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.gameView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.gameView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.gameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.gameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
}

extension GameViewController: PokemonManagerDelegate{
    func pokemonDidUpdate(_ pokemonManager: PokemonManager, models: [PokemonDTO]) {
        self.pokemons = models.choose(length: 4)
        let randomIndex = Int.random(in: 0..<self.pokemons.count)
        
        for pokemon in self.pokemons {
            print(pokemon.name)
        }
        
        print("selected pokemon: \(self.pokemons[randomIndex].name)")
        self.imageManager.fetchRequest(url: self.pokemons[randomIndex].url)
    }
    
    func pokemonDidNotUpdate(error: Error) {
        print(error)
    }
}

extension GameViewController: ImageManagerDelegate{
    func imageDidUpdate(_ imageManager: ImageManager, model: ImageDTO) {
        DispatchQueue.main.async { [weak self] in
            self?.gameView.setImagePic(url: model.imageURL)
        }
        
    }
    
    func imageDidNotUpdate(error: Error) {
        print(error)
    }
    
    
}
