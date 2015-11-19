//
//  SignUpViewController.swift
//  PHPMySQL
//
//  Created by Xuan Yang on 10/5/15.
//  Copyright © 2015 Miraco. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userEmailAddressTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userPasswordRepeatTextField: UITextField!
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject)
    {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //SIGN UP BUTTON
    @IBAction func signUpButtonTapped(sender: AnyObject)
    {
        let userEmail = userEmailAddressTextField.text!
        let userPassword = userPasswordTextField.text!
        let userPasswordRepeat = userPasswordRepeatTextField.text!
        let userFirstName = userFirstNameTextField.text!
        let userLastName = userLastNameTextField.text!
        
        if(userPassword != userPasswordRepeat)
        {
            //display alert
            displayAlertMessage("Passwords do not match")
            return
        }
        
        if(userEmail.isEmpty || userPassword.isEmpty || userPasswordRepeat.isEmpty || userFirstName.isEmpty || userLastName.isEmpty)
        
        {
            //display alert
            displayAlertMessage("All fields are required")
            return
        }
        
        
        //MB Process HUD
        let spinningActivity = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        spinningActivity.labelText = "Loading"
        spinningActivity.detailsLabelText = "Please wait..."
        
        // send HTTP Post
        let myUrl = NSURL(string: "http://fibonaccifashiontech.com/PHPMySQL/scripts/registerUser.php")
        let postString = "userEmail=\(userEmail)&userFirstName=\(userFirstName)&userLastName=\(userLastName)&userPassword=\(userPassword)" as NSString
        let request = NSMutableURLRequest(URL: myUrl!)
        
        request.HTTPMethod = "POST"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // parse JSON
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            dispatch_async(dispatch_get_main_queue())
            {
                //hide MB Process HD
                spinningActivity.hide(true)
                
                if error != nil
                {
                    self.displayAlertMessage((error?.localizedDescription)!)
                }
                
                do {

                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? Dictionary<String, AnyObject>
                
                    if let parseJSON = json {
                        
                        var userId = parseJSON["userId"] as? String
                        print(userId)
                        
                        if userId != nil {
                            
                            NSUserDefaults.standardUserDefaults().setObject(parseJSON["userFirstName"], forKey: "userFirstName")
                            NSUserDefaults.standardUserDefaults().setObject(parseJSON["userLastName"], forKey: "userLastName")
                            NSUserDefaults.standardUserDefaults().setObject(parseJSON["userId"], forKey: "userId")
                            NSUserDefaults.standardUserDefaults().synchronize()
                            
                            var myAlert = UIAlertController(title: "Alert", message: "successfully registered user", preferredStyle: UIAlertControllerStyle.Alert)
                            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (ACTION) in
                                
                                //self.dismissViewControllerAnimated(true, completion: nil)
                                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                                appDelegate.buildNavigationDrawer()
                                
                            })
                            
                            myAlert.addAction(okAction)
                            self.presentViewController(myAlert, animated: true, completion: nil)
                        } else {
                            let errorMessage = parseJSON["message"] as? String
                            if(errorMessage != nil){
                                self.displayAlertMessage(errorMessage!)
                            }
                        }
                    }
                } catch let error as NSError {
                    print(error.debugDescription)
                }
            }
        }.resume()
    }
    
    
    //Alert Message
    func displayAlertMessage(userMessage: String)
    {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }


}
