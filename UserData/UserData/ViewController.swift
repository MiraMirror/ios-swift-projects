//
//  ViewController.swift
//  UserData
//
//  Created by Xuan Yang on 9/24/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favColorLbl: UILabel!
    
    var people = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favColorLbl.text = "\(color)"
        } else {
            favColorLbl.text = "pick favorite color"
        }
        
        let personA = Person(first: "Wing", last: "Chun")
        let personB = Person(first: "Mire", last: "Colly")
        let personC = Person(first: "Curtis", last: "Colly")
    
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func greenPressed(sender: AnyObject) {
        favColorLbl.text = "Green"
        NSUserDefaults.standardUserDefaults().setValue("Green", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.lastName)
                }
            }
        }
        
    }

    @IBAction func purplePressed(sender: AnyObject) {
        favColorLbl.text = "Purple"
        NSUserDefaults.standardUserDefaults().setValue("purple", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func yellowPressed(sender: AnyObject) {
        favColorLbl.text = "Yellow"
        NSUserDefaults.standardUserDefaults().setValue("yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }


}



