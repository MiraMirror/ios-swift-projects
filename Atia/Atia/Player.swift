//
//  Player.swift
//  Atia
//
//  Created by Xuan Yang on 9/19/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "name"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        _name = name
    }
    
}