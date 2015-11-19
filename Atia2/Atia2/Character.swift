//
//  Character.swift
//  Atia2
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 20
    
    var hp: Int {
        return _hp
    }
    
    var attackPwr: Int {
        return _attackPwr
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(hp: Int, attackPwr: Int) {
        self._attackPwr = attackPwr
        self._hp = hp
    }
    
    func attemptAttack(attackPwr: Int) -> Bool{
        self._hp -= attackPwr
        return true
    }
    
}