//
//  Datasource.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 17/10/23.
//

import Foundation
import UIKit
struct Datasource{
    struct Texts{
        public static let menuTitle: String = "WELCOME!"
        public static let menuButton: String = "PLAY"
    }
    
    struct Colors{
        public static let menuBackground: UIColor = .white
        public static let gameBackground: UIColor = .yellow
        public static let buttonBorder: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    struct NumericInfo{
        public static let optionsAmount: Int = 4
    }
}
