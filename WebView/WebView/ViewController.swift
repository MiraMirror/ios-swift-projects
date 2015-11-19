//
//  ViewController.swift
//  WebView
//
//  Created by Xuan Yang on 9/24/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        container.addSubview(webView)
        
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        
        webView.frame=frame
        
        let urlStr = "http://lanocast.com/"
        
        //"http://developer.apple.com/swift/blog/"
        
        //"http://lanocast.com"
        
        let url = NSURL(string: urlStr)!
        
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

