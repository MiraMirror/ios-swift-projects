//
//  ViewController.swift
//  Virginia
//
//  Created by Xuan Yang on 9/23/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit
import Alamofire



class ViewControllerTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var uglyThings = ["http://www.justonecookbook.com/wp-content/uploads/2011/01/Unagi-Chazuke-III.jpg",
    "https://s-media-cache-ak0.pinimg.com/236x/b0/d7/6a/b0d76ab32a593fbc55223b0514bd424d.jpg",
    "https://s-media-cache-ak0.pinimg.com/736x/80/02/1a/80021a7c9a9c3f493ba705614000b135.jpg",
    "http://cdn.earthporm.com/wp-content/uploads/2014/09/japanese-food-art-153__605.jpg",
    "http://ak-hdl.buzzfed.com/static/enhanced/webdr03/2013/3/1/12/enhanced-buzz-28686-1362158162-11.jpg"]
    
    var uglyTitles = ["yummy", "delicious", "sushi!", "noodles", "teriyaki"]
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("uglyCell") as? uglyCell {
            
            var img: UIImage!
            
            let url = NSURL(string: uglyThings[indexPath.row])!
            
            if let data = NSData(contentsOfURL: url) {
                
                img = UIImage(data: data)
                
            } else {
                
                img = UIImage(named: "itdoesntexist")
                
            }
            
            cell.configureCell(img, text: uglyTitles[indexPath.row])
            
            return cell
            
        } else {
            
            return uglyCell()
            
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uglyThings.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}
