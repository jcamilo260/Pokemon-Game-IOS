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
        public static let defaultHint: String = "GUESS THE POKEMON!"
        public static let score: String = "SCORE : "
        public static let wrongPokemon: String = "Nope, it is"
        public static let resultsTitle: String = "FINAL SCORE"
        public static let retryButton: String = "RETRY"
        public static let motivationMessages: [String] = ["You rock", "Awesome", "Nice job", "You are on fire"]
    }
    
    struct Colors{
        public static let menuBackground: UIColor = .white
        public static let gameBackground: UIColor = .yellow
        public static let resultsBackground: UIColor = UIColor(red: 229/255, green: 89/255, blue: 52/255, alpha: 1)
        public static let buttonBorder: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    struct NumericInfo{
        public static let optionsAmount: Int = 4
    }
}
