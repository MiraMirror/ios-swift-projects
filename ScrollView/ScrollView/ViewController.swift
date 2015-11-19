//
//  ViewController.swift
//  ScrollView
//
//  Created by Xuan Yang on 9/24/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let WIDTH: CGFloat = 240
    let HEIGHT: CGFloat = 400
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var x = 1; x <= 5; x++ {
            let img = UIImage(named: "\(x)")
            let imgView = UIImageView(image: img)
            scrollView.addSubview(imgView)
            
            imgView.frame = CGRectMake(-WIDTH + (WIDTH * CGFloat(x)), 165, WIDTH, HEIGHT)
            
        }
        
        scrollView.contentSize = CGSizeMake(WIDTH * 5, scrollView.frame.size.height)
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

