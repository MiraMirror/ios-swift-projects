//
//  main.swift
//  classes and objects
//
//  Created by Xuan Yang on 1/3/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import Foundation

let myCar = Car(customerChosenColor: "Red")
let mySecondCar = Car(customerChosenColor: "Green")
let aCar = Car()

print(myCar.color)
print(mySecondCar.color)
print(aCar.color)

myCar.drive()

let mySelfDrivingCar = SelfDrivingCar(customerChosenColor: "Pink")
print(mySelfDrivingCar.color)

mySelfDrivingCar.drive()
