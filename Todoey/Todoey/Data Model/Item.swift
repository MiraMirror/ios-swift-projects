//
//  Item.swift
//  Todoey
//
//  Created by Xuan Yang on 1/17/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    
    //reverse relationship to Category data
    let parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
