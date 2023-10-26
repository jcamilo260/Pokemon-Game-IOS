//
//  UIMenuButton.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 17/10/23.
//

import Foundation
import UIKit

class UIMenuButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layout()
    }
    
    private func layout(){
        self.setupShape()
    }
    
    private func setupShape(){
        self.clipsToBounds = true
        self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.layer.borderWidth = 3
    }
    
    public func doAnimation(animation: ()->Void){
        animation()
    }
    
    
}
