import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init(){
        // Creating a quiz item and appending it to the list
        let item = Question(text: "Pandora is created by Cordova", correctAnswer: true)
        
        // Add the Question to the list of questions
        list.append(item)
        
        // skipping one step and just creating the quiz item inside the append function
        list.append(Question(text: "Giblatar was the original name of Pandora before Wrath of Pendulum event", correctAnswer: true))
        
        list.append(Question(text: "The Ancient Gauntlet is located in the \"Northern Hemisphere\" of Pandora's capital city, Fasa.", correctAnswer: true))
        
        list.append(Question(text: "Prior to Pandora establishment, the ancient words of \"humans\" were widely spoken before the catastrophic event of \"The Awakening\" arrives ", correctAnswer: false))
        
        list.append(Question(text: "To own Pandora citizenship, one must possess skills in, not limited to : Alchemy, Machine Learning, and Software Engineering", correctAnswer: true))
        
        list.append(Question(text: "Steampunk is a must-know knowledge for Pandora citizens ", correctAnswer: false))
        
        list.append(Question(text: "In Pandora, all types of magics are considered as advanced science", correctAnswer: true))
        
        list.append(Question(text: "", correctAnswer: false))
        
        list.append(Question(text: "Google was originally called \"Backrub\".", correctAnswer: true))
        
        list.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))
        
        list.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))
        
        list.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))
        
        list.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true))
        
        //Second Arc
         list.append(Question(text: "Beginner's sword is known as Zhukon", correctAnswer: true))
         list.append(Question(text: "Pandora Box is real", correctAnswer: true))
         list.append(Question(text: "Lolll", correctAnswer: true))
         list.append(Question(text: "Lololll", correctAnswer: true))
        list.append(Question(text: "Beginner's sworwwwdwjdnwjd is known as Zhukon", correctAnswer: true))
        list.append(Question(text: "Pandora Boxwbb is real", correctAnswer: true))
        list.append(Question(text: "Lolazzll", correctAnswer: true))
        list.append(Question(text: "Lolodbbhbdlll", correctAnswer: true))
        list.append(Question(text: "Beginner's sword is known as Zhukon", correctAnswer: true))
        list.append(Question(text: "Pandora Box is real", correctAnswer: true))
        list.append(Question(text: "Lolll", correctAnswer: true))
        list.append(Question(text: "Lololll", correctAnswer: true))
        list.append(Question(text: "Beginner's sworwwwdwjdnwjd is known as Zhukon", correctAnswer: true))
        list.append(Question(text: "Pandora Boxwbb is real", correctAnswer: true))
    }
}
