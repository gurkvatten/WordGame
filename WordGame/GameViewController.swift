//
//  GameViewController.swift
//  WordGame
//
//  Created by Johan Karlsson on 2023-03-22.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    let words = ["magic","mouse","ipod", "imac","iphone","mighty", "keyboard","mac","book","pro","air","nextstation","pipin","quicktake"]
    var shuffeledWords = [String]()
    var currentWordIndex = 0
    var currentScore = 0
    var timeLeft = 10.0
    let segueGoToScore = "scoreboard"
    
    
    var timer: Timer?
    @IBOutlet weak var wordInputField: UITextField!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        wordInputField.delegate = self
        wordLabel.text = words[currentWordIndex]
        shuffeledWords = words.shuffled()
        startTimer()
        
        
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        correctWord()
        return true
    }
    
    
    
    
    func correctWord() {
        timer?.invalidate()
        
        let writtenWord = wordInputField.text ?? ""
        
        if writtenWord == shuffeledWords[currentWordIndex] {
            currentScore += 1
            currentWordIndex += 1
        } else {
            currentScore -= 1
            currentWordIndex += 1
        }
        
        
        
        if currentWordIndex < shuffeledWords.count {
            timeLeft = 10.0
            wordLabel.text = shuffeledWords[currentWordIndex]
            wordInputField.text = ""
            startTimer()
        } else {
            performSegue(withIdentifier: segueGoToScore, sender: self)
        }
        updateScore()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate() {
        timeLeft -= 0.1
        
        if timeLeft <= 0{
            timeLeft = 0
            timer?.invalidate()
            timeUpdated()
        }
        
        timerLabel.text = String(format: "%.1f", timeLeft)
    }
    
    func timeUpdated() {
        currentScore -= 1
        currentWordIndex += 1
        
        if currentWordIndex < shuffeledWords.count {
            timeLeft = 10.0
            wordLabel.text = shuffeledWords[currentWordIndex]
            startTimer()
        }else {
            
        }
        
    }
    func updateScore() {
        score.text = String(currentScore)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scoreboard" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.finalScore = self.currentScore
        }
    }
    
    
    

    

}
