//
//  File.swift
//  Atia2
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Enemy : Character {
    private var _name: String = "Enemy"
    
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