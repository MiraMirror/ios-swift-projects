//
//  Atia.swift
//  Atia2
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Atia : Player{
    
    var immune: Int = 20
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr > immune {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }

    
}

