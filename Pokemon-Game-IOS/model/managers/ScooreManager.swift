//
//  ScooreManager.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 7/11/23.
//

import Foundation
struct ScoreManager{
    public var score: Int = 0
    
    public mutating func validateAnswer(userAnswer: String, correctAnswer: String)->Bool{
        
        if userAnswer == correctAnswer{
            score += 1
            return true
        }
        return false
    }
    
    public mutating func resetScore(){
        score = 0
    }
}
