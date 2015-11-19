//
//  Enemy.swift
//  Atia
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Enemy : Character {
    
    var loot: [String] {
        return ["rusty dagger", "buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func droploot() -> String? {
        if !isAlive  {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
}


