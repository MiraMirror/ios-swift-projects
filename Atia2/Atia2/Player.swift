//
//  Player.swift
//  Atia2
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name: String = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        
        self.init(hp:hp, attackPwr: attackPwr)
        _name = name
    }
    
}

