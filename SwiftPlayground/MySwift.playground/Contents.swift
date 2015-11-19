//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var Mybool = true
var MyBankAccount: Int

MyBankAccount = 1000000001
print(MyBankAccount)

if MyBankAccount > 1000000000 {
    print("I am a billionare!")
}else{
    print("I am working on it!")
}


func square(a:Int) -> Int {
    return a*a
}

square(5)




arc4random_uniform(2)


import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 20
    
    var hp: Int {
        get {
            return _hp
        }
        set {
            if newValue > _hp {
               _hp = newValue
            }
        }
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
        _hp -= attackPwr
        return true
    }
    
//    init() {
//        
//    }
    
}

var mira = Character(hp: 80, attackPwr: 60)
mira.attackPwr
mira.hp
mira.hp = 80
mira.hp




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



mira.hp





mira = Player(name: "mira", hp: 90, attackPwr: 25)

mira.hp
mira.attackPwr
mira._hp

























