//
//  GameButton.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 3/11/23.
//

import UIKit

class UIGameButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupShape()
    }
}

extension UIGameButton: ButtonProtocol{
    func setupShape() {
        self.clipsToBounds = true
        self.layer.borderColor = Datasource.Colors.buttonBorder.cgColor
        self.layer.borderWidth = 3
    }
    
    func doAnimation(animation: () -> Void) {
        animation()
    }
    
    
}


