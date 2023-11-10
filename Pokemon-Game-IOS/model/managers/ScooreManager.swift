//
//  ScooreManager.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 7/11/23.
//

import Foundation
struct ScoreManager{
    private var score: Int = 0
    public var _score: Int{
        return self.score
    }
    
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
