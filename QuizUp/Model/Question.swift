//
//  Question.swift
//  QuizUp
//
//  Created by Cordova on 4/11/18.
//  Copyright © 2018 Cordova. All rights reserved.
//

import Foundation
class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text:String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
    
}
