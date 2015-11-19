//
//  Person.swift
//  UserData
//
//  Created by Xuan Yang on 9/24/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    var firstName: String!
    var lastName: String!
    
    init(first: String, last: String) {
        self.firstName = first
        self.lastName = last
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
    
}