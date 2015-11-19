//
//  uglyCell.swift
//  Virginia
//
//  Created by Xuan Yang on 9/23/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class uglyCell: UITableViewCell {
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(image: UIImage, text: String){
        mainImg.image = image
        mainLbl.text = text 
        
    }
}
