//
//  ViewController.swift
//  Delegates and Protocols
//
//  Created by Xuan Yang on 1/5/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, CanReceive {
    
    var dataPassedFromSecondScreen : String?

    @IBOutlet weak var firstScreenLabel: UILabel!
    @IBOutlet weak var firstScreenTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSecendScreen" {
            
            let secondVC = segue.destination as! SecondViewController
            secondVC.textPassedFromFirstScreen = firstScreenTextField.text
            
            secondVC.delegate = self
            
        }
    }
    
    @IBAction func beamMeUpButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "goToSecendScreen", sender: self)
        
    }
    
    func dataReceived(data: String) {
        firstScreenLabel.text = data
    }
    
    
}

