//
//  secondArc.swift
//  QuizUp
//
//  Created by Cordova on 4/12/18.
//  Copyright © 2018 Cordova. All rights reserved.
//

import Foundation

class secondArc {
    
    var list = [Question]()
    
    //Initialize The Second Arc : Armories
    init(){
        let item = Question(text: "Blue Dragon Silk is one of Pandora's legendary weapon that once crafted by one of the /Ancient Paladins/", correctAnswer: true)

        list.append(item)
        
        // skipping one step and just creating the quiz item inside the append function
        list.append(Question(text: "Beginner's sword is known as Zhukon", correctAnswer: true))
        
        list.append(Question(text: "Zynophia is forbidden tribe located in the Pandora Eastern Hemisphere", correctAnswer: true))
        
        list.append(Question(text: "Pendulum is the ultimate sacred gem in Pandora universe", correctAnswer: true))
        
        list.append(Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: true))
        
        list.append(Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false))
        
        list.append(Question(text: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true))
        
        list.append(Question(text: "You can lead a cow down stairs but not up stairs.", correctAnswer: false))
        
        list.append(Question(text: "Google was originally called \"Backrub\".", correctAnswer: true))
        
        list.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))
        
        list.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))
        
        list.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))
        
        list.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true))
        
        
        
        
    }

}
