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
    private lazy var scoreManager: ScoreManager = ScoreManager()
    private var correctPokemon: PokemonDTO?
    private var pokemons: [PokemonDTO] = []{
        didSet{
            self.setupButtonTitle()
        }
    }
    private var canSelectOption: Bool = true
    private var gameFinished: Bool = false
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Datasource.Colors.gameBackground
        self.setupUIGameView()
        self.setupButtonsAction()
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
    
    private func setupButtonTitle(){
        DispatchQueue.main.async { [weak self] in
            if let pokemons = self?.pokemons{
                for (index, pokemon) in pokemons.enumerated(){
                    self?.gameView._gameButtons[index].setupTitle(title: pokemon.name.capitalized)
                }
            }
        }
    }
    
    private func setupButtonsAction(){
        for button in gameView._gameButtons{
            button.addTarget(self, action: #selector(buttonPressedAction), for: .touchUpInside)
        }
    }
    
    @objc private func buttonPressedAction(_ sender: UIGameButton){
        if let selectedAnswer = sender.titleLabel?.text{
            self.validateAnswer(selectedAnswer: selectedAnswer, button: sender)
        }
    }
    
    private func validateAnswer(selectedAnswer: String, button: UIGameButton){
        if self.canSelectOption && self.correctPokemon != nil{
            if self.scoreManager.validateAnswer(userAnswer: selectedAnswer, correctAnswer: self.correctPokemon!.name.capitalized){
                self.gameView.setHintLabel(text: Datasource.Texts.motivationMessages[Int.random(in: 0..<Datasource.Texts.motivationMessages.count)])
                self.gameView.setScoreLabel(score: self.scoreManager._score)
                button.backgroundColor = .green
            }else{
                self.gameFinished = true
                self.gameView.setHintLabel(text: "\(Datasource.Texts.wrongPokemon) \(self.correctPokemon!.name)")
                button.backgroundColor = .red
            }
            self.canSelectOption = false
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] in
                self?.counter += 1
                if self?.counter == 2{
                    if self?.gameFinished ?? true{
                        self?.resetData(gameFinished: true)
                        print("Stop")
                    }else{
                        self?.resetData(gameFinished: false)
                    }
                    $0.invalidate()
                }
            }
        }
    }
    
    private func resetData(gameFinished: Bool){
        if gameFinished{
            self.scoreManager.resetScore()
            self.gameView.setScoreLabel(score: self.scoreManager._score)
            self.gameFinished = false
        }
        else{
            self.pokemonManager.fetchRequest()
        }
        self.gameView.setHintLabel(text: Datasource.Texts.defaultHint)
        for button in self.gameView._gameButtons{
            button.backgroundColor = .clear
        }
        self.canSelectOption = true
        self.counter = 0

    }
}

extension GameViewController: PokemonManagerDelegate{
    func pokemonDidUpdate(_ pokemonManager: PokemonManager, models: [PokemonDTO]) {
        self.pokemons = models.choose(length: 4)
        let randomIndex = Int.random(in: 0..<self.pokemons.count)
        self.correctPokemon = self.pokemons[randomIndex]
        
        for (pokemon) in self.pokemons {
            print(pokemon.name)
        }
        
        print("selected pokemon: \(self.correctPokemon!.name)")
        self.imageManager.fetchRequest(url: self.pokemons[randomIndex].url)
    }
    
    func pokemonDidNotUpdate(error: Error) {
        print(error)
    }
}

extension GameViewController: ImageManagerDelegate{
    func imageDidUpdate(_ imageManager: ImageManager, model: ImageDTO) {
            self.gameView.mutateStack(hidePic: true)
        DispatchQueue.main.async { [weak self] in
            self?.gameView.setImagePicWithEffect(url: model.imageURL)
            self?.gameView.mutateStack(hidePic: false)
        }
    }
    
    func imageDidNotUpdate(error: Error) {
        print(error)
    }
    
    
}
