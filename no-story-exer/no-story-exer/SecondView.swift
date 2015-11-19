//
//  SecondView.swift
//  no-story-exer
//
//  Created by Xuan Yang on 9/23/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class SecondView: UIViewController {

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
    
    @IBOutlet weak var secondViewLbl: UILabel!
    
    var printTxtSecond = ""
    
    convenience init(printMe: String) {
        self.init(nibName: "SecondView", bundle: nil)
        printTxtSecond = printMe
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        secondViewLbl.text = printTxtSecond
    }
    
    
    var firstViewFromSecond: FirstView!
    
    @IBAction func goBackToFirst(Sender: AnyObject) {
        firstViewFromSecond = FirstView(printMe: "Welcome back from Second View!")
        self.presentViewController(firstViewFromSecond, animated: true, completion: nil)
        //self.presentViewController(firstView, animated: true, completion: nil)
    }
    
    var thirdViewFromSecond: ThirdView!
    
    @IBAction func goThirdView(Sender: AnyObject) {
        thirdViewFromSecond = ThirdView(printMe: "Welcome to the Third View!")
        self.presentViewController(thirdViewFromSecond, animated: true, completion: nil)
    }
    
}
