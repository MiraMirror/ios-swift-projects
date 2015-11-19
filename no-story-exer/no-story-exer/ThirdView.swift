//
//  ThirdView.swift
//  no-story-exer
//
//  Created by Xuan Yang on 9/23/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class ThirdView: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var thirdViewLbl: UILabel!
    
    var printTxtThird = ""
    convenience init(printMe: String) {
        self.init(nibName: "ThirdView", bundle: nil)
        printTxtThird = printMe
    }
    
    var secondViewFromThird: SecondView!
    
    @IBAction func goBackToSecond(sender: AnyObject) {
        secondViewFromThird = SecondView(printMe: "Welcome Back from Third View!")
        self.presentViewController(secondViewFromThird, animated: true, completion: nil)
    }
    
    @IBOutlet weak var thirdViewLbl2: UILabel!

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        thirdViewLbl2.text = printTxtThird
    }


}
