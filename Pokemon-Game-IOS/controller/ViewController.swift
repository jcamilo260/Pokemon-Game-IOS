//
//  ViewController.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 17/10/23.
//

import UIKit

class ViewController: UIViewController {

    private let uiMenu: UIMenuView = UIMenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
        self.setupButtonAction()
    }
    
    private func layout(){
        self.view.backgroundColor = Datasource.Colors.menuBackground
        self.setupUIMenu()
    }
    
    private func setupUIMenu(){
        self.view.addSubview(self.uiMenu)
        self.uiMenu.translatesAutoresizingMaskIntoConstraints = false
        let safeZone = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.uiMenu.topAnchor.constraint(equalTo: safeZone.topAnchor),
            self.uiMenu.bottomAnchor.constraint(equalTo: safeZone.bottomAnchor),
            self.uiMenu.leadingAnchor.constraint(equalTo: safeZone.leadingAnchor),
            self.uiMenu.trailingAnchor.constraint(equalTo: safeZone.trailingAnchor)
        ])
    }
    
    private func setupButtonAction(){
        self.uiMenu._menuButton.addTarget(self, action: #selector(changeToGameView), for: .touchUpInside)
    }
    
    @objc private func changeToGameView(){
        let gameView: GameViewController = GameViewController()
        gameView.modalTransitionStyle = .flipHorizontal
        gameView.modalPresentationStyle = .fullScreen
        self.present(gameView, animated: true)
    }
}

