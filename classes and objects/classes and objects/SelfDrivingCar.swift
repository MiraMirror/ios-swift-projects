//
//  SelfDrivingCar.swift
//  classes and objects
//
//  Created by Xuan Yang on 1/3/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    
    var destination : String?
    
    
    override func drive() {
        super.drive()
        
        if let userSetDestination = destination {
            print("driving towards " + userSetDestination)
        }
        else {
            print("We need a destination")
        }
        
    }
    
}
