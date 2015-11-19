//: Playground - noun: a place where people can play

import UIKit

var lotteryWinnings: Int?


print(lotteryWinnings)

if lotteryWinnings != nil {
    print(lotteryWinnings!)
}


if let Winnings = lotteryWinnings {
    print (Winnings)
}

if let Winnings = lotteryWinnings {
    print (lotteryWinnings)
}



class Car {
    var model: String?
}

var vehicle: Car?

if let v = vehicle, m = v.model {
    print(v.model)
}


vehicle = Car()
vehicle?.model = "Accord"

if let v = vehicle, m = v.model {
    print(v.model)
}

var cars: [Car]?

cars = [Car]()

cars






