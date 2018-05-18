//
//  Car.swift
//  classes and objects
//
//  Created by Xuan Yang on 1/3/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    
    var color = "Black"
    var numberOfSeats = 9
    var typeOfCar : CarType = .Coupe
    
    init(){
        
    }
    
    convenience init(customerChosenColor : String){
        self.init()
        color = customerChosenColor
    }
    
    func drive() {
        print("car is moving")
    }
    
}


