//
//  DevilWizard.swift
//  Atia
//
//  Created by Xuan Yang on 9/20/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }

    override var type: String {
        return "Devil Wizard"
    }
    
    
}