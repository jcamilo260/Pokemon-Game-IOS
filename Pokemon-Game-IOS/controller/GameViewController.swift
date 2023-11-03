//
//  GameViewController.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation
import UIKit
import Kingfisher

class GameViewController: UIViewController{
    
    private lazy var pokemonManager: PokemonManager = PokemonManager()
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
        self.pokemonManager.delegate = self
        self.pokemonManager.fetchRequest()
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
        
    }
    
    func pokemonDidNotUpdate(error: Error) {
        print(error)
    }
}

extension GameViewController: ImageManagerDelegate{
    func imageDidUpdate(_ imageManager: ImageManager, model: ImageDTO) {
        
    }
    
    func imageDidNotUpdate(error: Error) {
        print(error)
    }
    
    
}
