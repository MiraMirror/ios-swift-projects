
//parse JSON
do {
    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
    
    if let parseJSON = json
    {
        let userId = parseJSON["userId"]
        
        if(userId != nil)
        {
            var myAlert = UIAlertController(title: "Alert", message: "Successully registered user", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (ACTION) in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true, completion: nil)
        } else
        {
            let errorMessage = parseJSON["message"]
            if(errorMessage != nil)
            {
                self.displayAlertMessage(errorMessage! as! String)
            }
            
        }
    }
} catch let error as NSError
{
    print(error.debugDescription)
}
}


//: Playground - noun: a place where people can play

import UIKit

class person {
    var eyeColor = "Brown"
    var name: String
    var speed = "10 MPH"
    var benchPress = "200 LBS"
    
    init(name:String) {
        self.name = name
    }
    
    func catchPhrase() -> String {
        return "Hi, I'm a crazy person"
    }
}


var Mira = person(name: "Mira")

Mira.name

Mira.eyeColor = "Yellow"

Mira.eyeColor

class animorph: person {
    
    var animalType = "Dog"
    
    convenience init(type: String, name: String){
        self.init(name:name)
        self.animalType = type
    }
    
    override func catchPhrase() -> String {
        return "I'm an intelligent dog"
    }
    
}

var Baobao = animorph(name: "Baobao")

Baobao.animalType
Baobao.catchPhrase()

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

airports["YYZ"]





