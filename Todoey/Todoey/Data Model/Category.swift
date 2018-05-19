//
//  Category.swift
//  Todoey
//
//  Created by Xuan Yang on 1/17/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    @objc dynamic var backgroundColor : String?
    
    // relationship to Item data
    let items = List<Item>()
    
    
    
}
