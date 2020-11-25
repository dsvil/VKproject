//
//  TestGuessNumVC.swift
//  vk
//
//  Created by Дорожкин Сергей on 17.11.2020.
//

import UIKit

class TestGuessNumVC: UIViewController {
    
    @IBOutlet weak var trialsLabel: UILabel!
    @IBOutlet weak var en: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        trialsLabel.text = "You have \(trials) trials"
    }
    var count = 1
    let trials = 5
    var guessedNum: Int = Int.random(in: 0...100)
    
    @IBAction func startAgain(_ sender: Any) {
        count = 1
        guessedNum = Int.random(in: 0...100)
        view.backgroundColor = UIColor.black
        alert("The guessed number is changed! \nYou can start again!")
    }
    @IBAction func guessedText(_ sender: Any) {
        countTrials()
    }
    @IBAction func guessed(_ sender: Any) {
        countTrials()
    }
    func countTrials(){
        if count <= trials {
            checkNum()
            count += 1
            en.text = ""
        } else {
            alert ("No more trials, pal!")
        }
    }
    func checkNum (){
        let num = en.text
        switch Int(num!) {
        case _ where Int(num!) == nil:
            alert ("No number")
        case guessedNum:
            view.backgroundColor = UIColor.red
            alert("You are correct! But it took \(count) to win!")
            count = trials
        case _ where count == trials:
            alert("You lost the game! Correct number was \(guessedNum)!")
        case _ where Int(num!)! > 100 || Int(num!)! < 0:
            alert ("Your number is out of range")
        case _ where Int(num!)! > guessedNum:
            alert ("Your number is too big, \(trials-count) trials left")
        case _ where Int(num!)! < guessedNum:
            alert ("Your number is too small, \(trials-count) trials left")
        default:
            alert ("Wrong number")
        }
    }
    
    func alert(_ message:String) {
        let alter = UIAlertController(
            title: "Result of the Trial",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
}
