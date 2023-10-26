//
//  LabelFactory.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 25/10/23.
//

import Foundation
import UIKit

class LabelFactory{
    
    public static func build(
        text: String, font: UIFont = UIFont.systemFont(ofSize: 20), textAlignment: NSTextAlignment = .center, colorText: UIColor = .black
    )->UILabel{
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        label.textAlignment = textAlignment
        label.textColor = colorText
        return label
    }
    
}
