//
//  Character.swift
//  Atia
//
//  Created by Xuan Yang on 9/19/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0{
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._attackPwr = attackPwr
        self._hp = startingHp
    }
    
    func attemptAttack(attachPwr: Int) -> Bool {
        self._hp -= attachPwr
        return true
    }
    
    
    
}