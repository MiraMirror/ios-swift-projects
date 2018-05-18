//
//  SecondViewController.swift
//  Delegates and Protocols
//
//  Created by Xuan Yang on 1/5/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import UIKit

protocol CanReceive {
    func dataReceived(data : String)
}

class SecondViewController: UIViewController {
    
    var textPassedFromFirstScreen : String?
    var delegate : CanReceive?

    @IBOutlet weak var secondScreenLabel: UILabel!
    @IBOutlet weak var secondScreenTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondScreenLabel.text = textPassedFromFirstScreen

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendBackButtonPressed(_ sender: Any) {
        delegate?.dataReceived(data: secondScreenTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func amIOriginalButtonPressed(_ sender: Any) {
        
        view.backgroundColor = UIColor.darkGray
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
