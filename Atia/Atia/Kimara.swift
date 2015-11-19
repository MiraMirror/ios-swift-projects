//
//  Kimara.swift
//  Atia
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation


class Kimara: Enemy {
    
    
    let IMMUNE_MAX = 15
    
    override var loot:[String] {
        return ["tough hide", "kimara venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attachPwr: Int) -> Bool {
        if attachPwr > IMMUNE_MAX {
            return super.attemptAttack(attachPwr)
        } else {
            return false
        }
    }
    
}