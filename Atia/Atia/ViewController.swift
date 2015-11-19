//
//  ViewController.swift
//  Atia
//
//  Created by Xuan Yang on 9/19/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    @IBOutlet weak var attackBtn: UIButton!
    
    
    var player : Player!
    var enemy : Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        player = Player(name: "Atia", hp: 130, attackPwr: 30)
        playerHpLbl.text = "\(player.hp) HP"
        generateRandomEnemy()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    func generateRandomEnemy(){
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 20)
        } else {
            enemy = DevilWizard(startingHp: 80, attackPwr: 15)
        }
        enemyImg.hidden = false
        
    }

    @IBAction func onAttackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP!"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attacked was unsuccessful!"
        }
        
        if let loot = enemy.droploot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)!"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed enemy \(enemy.type)"
            enemyImg.hidden = true
        }
    }
}

