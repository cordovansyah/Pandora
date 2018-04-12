//
//  ViewController.swift
//  QuizUp
//
//  Created by Cordova on 4/11/18.
//  Copyright © 2018 Cordova. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
  
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    var randomHomeImage : Int = 0
    var gameState : Int = 0
    var player: AVAudioPlayer = AVAudioPlayer()
    
   

    


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelMap: UILabel!
  
    
    @IBOutlet weak var gameBG: UIImageView!
    
    var images:[String] = []
    var timer = Timer()
    
    var photoCount:Int = 0
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        do
//        {
//            let audiopath = Bundle.main.path(forResource: "song", ofType: "flac")
//            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audiopath!) as URL)
//        }
//        catch
//        {
//
//        }
//        player.play()
        
        nextQuestion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        images = ["gambar1", "gambar2", "gambar3", "gambar4", "gambar5", "gambar6"]
        randomHomeImage = Int(arc4random_uniform(6))
        home?.image = UIImage(named : images[randomHomeImage])
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(onTransition), userInfo: nil, repeats: true)
    }
    
    //Transition
    @IBOutlet var home: UIImageView?


    @objc func onTransition() {
        if (photoCount < images.count - 1){
            photoCount = photoCount  + 1;
        }else{
            photoCount = 0;
        }
        if let view = self.home {
            UIView.transition(with: view, duration: 1, options: .transitionCrossDissolve, animations: {
                view.image = UIImage.init(named: self.images[self.photoCount])
            }, completion: nil)
        }
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        
        nextQuestion()
        
    }

    func nextQuestion(){
        if questionNumber <= 12 {
            questionLabel?.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        } else if questionNumber >= 12 && questionNumber <= 13 {
            checkScore()
            
        }
        
        if questionNumber >= 13 && questionNumber <= 26 {
            questionLabel?.text = allQuestions.list[questionNumber].questionText
            arc2UI()
            
        } else if questionNumber >= 26 {
            checkScore()
        }
    }
    
    


    func updateUI(){
        scoreLabel?.text = "\(score)"
        levelLabel?.text = "\(questionNumber + 1) / 13"
        gameBG?.image = UIImage(named: "gambar6")
        levelMap?.text = "ARC I : THE JOURNEY"
        progressBar?.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)

    }
    func arc2UI() {
        scoreLabel?.text = "\(score)"
        levelLabel?.text = "\(questionNumber + 1) / 27"
        levelMap?.text = "ARC II : ODYSSEY"
        imageLevelTransition()
        gameBG.image = UIImage(named: "image2")
        progressBar?.frame.size.width = (view.frame.size.width / 27) * CGFloat(questionNumber + 1)
    }
    

    //image transition
    func imageLevelTransition(){
        UIView.transition(with: self.gameBG,
                          duration:0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.gameBG.image = UIImage(named: "image2") },
                          completion: nil)
    }
    
    func checkScore() {
        if score >= 8 {
            let alert = UIAlertController(title: "Congratulations", message: "You completed and passed the First Arc with score \(score)", preferredStyle : .alert )
            
            let restartAction = UIAlertAction(title: "Continue", style: .default, handler : { (UIAlertAction) in
                self.progressBar?.frame.size.width = 0
                self.continueArc()
                
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
            
        } else {
            let alert = UIAlertController(title: "Sorry", message: "Judging from your final score, which is \(score), we won't risk you to venture farther. Try again", preferredStyle : .alert)
            
            let restartAction = UIAlertAction(title: "Retry", style: .default, handler : { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func continueArc() {
        questionNumber = 13
        score = 0
    }
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    

    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            
            let hud = JGProgressHUD(style: .dark)
            hud.vibrancyEnabled = true
            hud.textLabel.text = "Checking"
            hud.textLabel.font = UIFont.systemFont(ofSize: 15.0)
            hud.layoutMargins = UIEdgeInsetsMake(0.0, 0.0, 5.0, 0.0)


            hud.show(in: self.view)

            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                UIView.animate(withDuration: 0.1) {
                    hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                    hud.textLabel.font = UIFont.systemFont(ofSize: 15.0)
                    hud.textLabel.text = "You're correct !"
                    hud.position = .center
                }
            }

            hud.dismiss(afterDelay: 2.0)
            score = score + 1
        }
        else {
            
            let hud = JGProgressHUD(style: .dark)
            hud.vibrancyEnabled = true
            hud.textLabel.text = "Checking"
            hud.layoutMargins = UIEdgeInsetsMake(0.0, 0.0, 5.0, 0.0)

            hud.show(in: self.view)

            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)){
                UIView.animate(withDuration: 0.1){
                    hud.indicatorView = JGProgressHUDErrorIndicatorView()
                    hud.textLabel.font = UIFont.systemFont(ofSize: 15.0)
                    hud.textLabel.text = "You're wrong !"
                    hud.position = .center
                }
            }

            hud.dismiss(afterDelay: 2.0)
        }
    }
    

}

