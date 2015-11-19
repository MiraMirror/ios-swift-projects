//
//  ViewController.swift
//  no-story-exer
//
//  Created by Xuan Yang on 9/23/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class FirstView: UIViewController {

    var secondView: SecondView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var firstViewLbl: UILabel!
    
    
    var printTxt = ""
    
    convenience init(printMe: String) {
        self.init(nibName: "FirstView", bundle: nil)
        printTxt = printMe
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        firstViewLbl.text = printTxt
    }

    @IBAction func goSecondView(sender: AnyObject) {
        secondView = SecondView(printMe:"Welcome to Second View!")
        self.presentViewController(secondView, animated: true, completion: nil)
        
    }
    
  

}

