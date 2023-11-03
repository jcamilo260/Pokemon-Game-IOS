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
}
    
extension UIMenuButton: ButtonProtocol{
    func setupShape(){
        self.clipsToBounds = true
        self.layer.borderColor = Datasource.Colors.buttonBorder.cgColor
        self.layer.borderWidth = 3
    }
    
    public func doAnimation(animation: ()->Void){
        animation()
    }
    
}

