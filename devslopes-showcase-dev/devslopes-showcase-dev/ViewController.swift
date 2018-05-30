//
//  ViewController.swift
//  devslopes-showcase-dev
//
//  Created by Mark Price on 8/21/15.
//  Copyright © 2015 devslopes. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //If the user is already logged in take them straight to the next screen
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            self.performSegueWithIdentifier("loggedIn", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func attemptLogin(sender: UIButton!) {
        
        //Make sure there is an email and a password
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            DataService.ds.REF_BASE.authUser(email, password: pwd) { error, authData in
                
                if error != nil {
                    print(error.code)
                    
                    if error.code == STATUS_ACCOUNT_NOEXIST {
                        DataService.ds.REF_BASE.createUser(email, password: pwd,
                            withValueCompletionBlock: { error, result in
                                if error != nil {
                                    self.showErrorAlert("Could not create account", msg: "Problem creating account. Try something else")
                                } else {
                                    let uid = result["uid"] as? String
                                    NSUserDefaults.standardUserDefaults().setValue(uid, forKey: KEY_UID)
                                    
                                    DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                                        
                                        //Store what type of account this is
                                        let user = ["provider": authData.provider!]
                                        DataService.ds.createFirebaseUser(uid!, user: user)
                                        
                                    })
                                    self.performSegueWithIdentifier("loggedIn", sender: nil)
                                }
                        })
                    } else {
                        self.showErrorAlert("Error loggin in", msg: "Could not log in. Check your username and password")
                    }
                    
                } else {
                    self.performSegueWithIdentifier("loggedIn", sender: nil)
                }
            }
        } else {
            showErrorAlert("Email & Password Required", msg: "You must enter an email address and a password")
        }
    }

    func showErrorAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                
                DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData  in
                    
                    if error != nil {
                        print("Login failed. \(error)")
                    } else {
                        print("Logged In! \(authData)")
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        
                        //Store what type of account this is
                        let user = ["provider": authData.provider!]
                        DataService.ds.createFirebaseUser(authData.uid, user: user)
                        
                        self.performSegueWithIdentifier("loggedIn", sender: nil)
                    }
                })
            }
        }
    }


}

