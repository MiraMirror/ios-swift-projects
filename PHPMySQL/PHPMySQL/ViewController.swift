//
//  ViewController.swift
//  PHPMySQL
//
//  Created by Xuan Yang on 10/5/15.
//  Copyright © 2015 Miraco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userEmailAddressTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailAddressTextField.text!
        let userPassword = userPasswordTextField.text!
        
        if(userEmail.isEmpty || userPassword.isEmpty){
            
            displayAlertMessage("Email and Password are required")
            return
        }
        
        //MB Process HUD
        let spinningActivity = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        spinningActivity.labelText = "Loading"
        spinningActivity.detailsLabelText = "Please wait..."
        
        
        //HTTP Request
        let myUrl = NSURL(string: "http://fibonaccifashiontech.com/PHPMySQL/scripts/userSignIn.php")!
        let postString = "userEmail=\(userEmail)&userPassword=\(userPassword)"
        
        let request = NSMutableURLRequest(URL: myUrl)
        request.HTTPMethod = "POST"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            //because json is got in the backend, need to do this so it can be used in mobile UI
            dispatch_async(dispatch_get_main_queue()){
                
                //hide MB Process HD
                spinningActivity.hide(true)
                
                //error handling
                if error != nil
                {
                    self.displayAlertMessage((error?.localizedDescription)!)
                }
                
                //json parsing
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? Dictionary<String, AnyObject>
                    
                    if let parseJSON = json {
                        
                        var userId = parseJSON["userId"] as? String
                        
                        if userId != nil {
                            
                            //store user information in mobile app (don't store sensitive information)
                            NSUserDefaults.standardUserDefaults().setObject(parseJSON["userFirstName"], forKey: "userFirstName")
                            NSUserDefaults.standardUserDefaults().setObject(parseJSON["userLastName"], forKey: "userLastName")
                            NSUserDefaults.standardUserDefaults().setObject(parseJSON["userId"], forKey: "userId")
                            NSUserDefaults.standardUserDefaults().synchronize()
                            
                            //take user to protected page
                            /*let mainPage = self.storyboard?.instantiateViewControllerWithIdentifier("MainPageViewController") as! MainPageViewController
                            let mainPageNav = UINavigationController(rootViewController: mainPage)
                            let appDelegate = UIApplication.sharedApplication().delegate
                            appDelegate?.window??.rootViewController = mainPageNav*/
                            
                            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                            appDelegate.buildNavigationDrawer()
                            
                        } else {
                            let message = parseJSON["message"] as? String
                            self.displayAlertMessage(message!)
                        }
                        
                        
                        
                    }
                    
                } catch let error as NSError {
                    print(error.debugDescription)
                }
                
                
                
            }
            
        }.resume()
    }

    func displayAlertMessage(userMessage: String)
    {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }

}

