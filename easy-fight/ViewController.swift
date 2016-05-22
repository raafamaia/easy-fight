//
//  ViewController.swift
//  easy-fight
//
//  Created by R. Maia on 5/19/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var player1Character: UIImageView!
    @IBOutlet weak var player2Character: UIImageView!
    @IBOutlet weak var attack1Button: UIButton!
    @IBOutlet weak var attack2Button: UIButton!
    @IBOutlet weak var hp1Lbl: UILabel!
    @IBOutlet weak var hp2Lbl: UILabel!
    @IBOutlet weak var restartBtn:UIButton!
    @IBOutlet weak var backgroundButton: UIView!
    
    var player1: Character!
    var player2: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = Ogre(_hp: 100, _attackPower: 15)
        player2 = Soldier(_hp: 100, _attackPower: 15)
        
        syncHPLabels()
        
    }
    
    @IBAction func onAttack1Pressed(sender: UIButton) {
        player2.attemptAttack(player1.attackPower)
        syncHPLabels()
        sendMessageToLabel("\(player1.name) attacked \(player2.name) for \(player1.attackPower) HP")
        if !checkGame() {
            disableButton(sender)
        }
    }
    
    @IBAction func onAttack2Pressed(sender: UIButton) {
        player1.attemptAttack(player2.attackPower)
        syncHPLabels()
        sendMessageToLabel("\(player2.name) attacked \(player1.name) for \(player2.attackPower) HP")
        if !checkGame() {
            disableButton(sender)
        }
    }
    
    @IBAction func restartGame() {
        player1 = Ogre(_hp: 100, _attackPower: 15)
        player2 = Soldier(_hp: 100, _attackPower: 15)
        
        syncHPLabels()
        sendMessageToLabel("")
        showRestart(false)
    }
    
    func checkGame() -> Bool{
        var end: Bool
        
        end = (player1.hp <= 0 || player2.hp <= 0)
        if(end) {
            printWinner()
            showRestart(true)
        }
        
        return end
    }
    
    func showRestart(op: Bool) {
        restartBtn.hidden = !op
        backgroundButton.hidden = !op
    }
    
    func printWinner() {
        let winner = (player1.hp < player2.hp ? player2 : player1)
        sendMessageToLabel("\(winner.name) won!")
    }
    
    func sendMessageToLabel(message: String) {
        messageLabel.text = message
    }
    
    func syncHPLabels() {
        hp1Lbl.text = "\(player1.hp) HP"
        hp2Lbl.text = "\(player2.hp) HP"
    }
    
    func disableButton(btn: UIButton) {
        btn.hidden = true
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(
            ViewController.enableButton), userInfo: btn.tag, repeats: false)
    }
    
    func enableButton(timer: NSTimer) {
        if let x = timer.userInfo where x as! NSObject == 1 {
            attack1Button.hidden = false
        } else if let x = timer.userInfo where x as! NSObject == 2 {
            attack2Button.hidden = false
        }
    }
    
    


}

