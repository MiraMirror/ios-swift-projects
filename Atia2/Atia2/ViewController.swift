//
//  ViewController.swift
//  Atia2
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftAttackBtn: UIButton!
    
    @IBOutlet weak var rightAttackBtn: UIButton!
    
    @IBOutlet weak var retartBtn: UIButton!
    
    @IBOutlet weak var msgLbl: UILabel!
    
    @IBOutlet weak var playerHp: UILabel!
    
    @IBOutlet weak var enemyHp: UILabel!
    
    @IBOutlet weak var rightAttackLbl: UILabel!
    
    @IBOutlet weak var leftAttackLbl: UILabel!
    
//    let delay = 9 * Double(NSEC_PER_SEC)
//    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
    let attackDelay = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC))) // 3 seconds
    
    var player: Player!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        player = Atia(name: "Atia", hp: 125, attackPwr: 20)
        enemy = Enemy(name: "aBitch", hp: 100, attackPwr: 30)
        
        playerHp.text = "\(player.hp) HP"
        enemyHp.text = "\(enemy.hp) HP"
        
        msgLbl.text = "\(player.name) against \(enemy.name)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func allowEnemyAttack() {
        leftAttackBtn.hidden = false
        leftAttackLbl.hidden = false
    }
    
    
    func allowPlayerAttack() {
        rightAttackBtn.hidden = false
        rightAttackLbl.hidden = false
    }
    
    
    @IBAction func onLeftAttackTapped(sender: AnyObject) {
        
        if player.attemptAttack(enemy.attackPwr){   //the function was called
            msgLbl.text = "\(enemy.name) attacked \(player.name) for \(enemy.attackPwr) HPs"
            playerHp.text = "\(player.hp) HP"
            rightAttackBtn.hidden = true
            rightAttackLbl.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "allowPlayerAttack", userInfo: nil, repeats: false)
        } else {
            msgLbl.text = "Attack was unsuccessful!"
        }
        
        if !player.isAlive {
            msgLbl.text = "\(enemy.name) WON!"
            playerHp.text = "Dead!"
            retartBtn.hidden = false
            leftAttackBtn.hidden = true
            leftAttackLbl.hidden = true
            rightAttackBtn.hidden = true
            rightAttackLbl.hidden = true
        }
        
    }


    @IBAction func onRightAttackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            enemyHp.text = "\(enemy.hp) HP"
            msgLbl.text = "\(player.name) attacked \(enemy.name) for \(player.attackPwr) HPs"
            leftAttackBtn.hidden = true
            leftAttackLbl.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "allowEnemyAttack", userInfo: nil, repeats: false)
            
        } else {
            msgLbl.text = "Attack was unsuccessful!"
        }
        
        if !enemy.isAlive {
            msgLbl.text = "\(player.name) WON!"
            enemyHp.text = "Dead!"
            retartBtn.hidden = false
            leftAttackBtn.hidden = true
            leftAttackLbl.hidden = true
            rightAttackBtn.hidden = true
            rightAttackLbl.hidden = true
        }

    }
    
    @IBAction func onRestartTapped(sender: AnyObject) {
        leftAttackBtn.hidden = false
        leftAttackLbl.hidden = false
        rightAttackBtn.hidden = false
        rightAttackLbl.hidden = false
        retartBtn.hidden = true
        viewDidLoad()
    }
    
}

