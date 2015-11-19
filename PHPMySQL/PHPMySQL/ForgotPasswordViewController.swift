//
//  ForgotPasswordViewController.swift
//  PHPMySQL
//
//  Created by Xuan Yang on 10/11/15.
//  Copyright © 2015 Miraco. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailAddressTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func resetPasswordButtonTapped(sender: AnyObject) {
        
        let userEmailAddress = emailAddressTextField.text!
        
        if(userEmailAddress.isEmpty){
            
            //Display alert
            displayAlertMessage("Email is required")
            return
        }
        
        //dismiss keyboard
        emailAddressTextField.resignFirstResponder()
        
        //don't user to wait and wonder what's going on?
        let spiningActivity = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        spiningActivity.labelText = "Loading"
        spiningActivity.detailsLabelText = "Please wait..."
        
        //send HTTP POST
        let myUrl = NSURL(string: "http://fibonaccifashiontech.com/PHPMySQL/scripts/requestNewPassword.php")
        let request = NSMutableURLRequest(URL: myUrl!)
        request.HTTPMethod = "POST"
        let postString = "userEmail=\(userEmailAddress)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            
            dispatch_async(dispatch_get_main_queue()){
                
                //hide spining activity
                spiningActivity.hide(true)
                
                //error handling
                if(error != nil){
                    self.displayAlertMessage((error?.localizedDescription)!)
                    return
                }
                
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    
                    if let parseJSON = json {
                        
                        var userEmail = parseJSON["userEmail"] as? String
                        if(userEmail != nil){
                            
                            var myAlert = UIAlertController(title: "Alert", message: "We have sent you an email, please check your inbox", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (ACTION) -> Void in
                                self.dismissViewControllerAnimated(true, completion: nil)
                            })
                            
                            myAlert.addAction(okAction)
                            
                            self.presentViewController(myAlert, animated: true, completion: nil)
                            
                        }else{
                            let message = parseJSON["message"] as? String
                            if message != nil {
                                self.displayAlertMessage(message!)
                            }
                        }
                        
                    }
                    
                    
                } catch let error as NSError {
                    print(error.debugDescription)
                }
                
            }
            
            
        }
        
        task.resume()
        
        
    }
    
    func displayAlertMessage(userMessage: String)
    {
    var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
    myAlert.addAction(okAction)
    self.presentViewController(myAlert, animated: true, completion: nil)
    
    }
}
