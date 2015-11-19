//
//  ViewController.swift
//  locatino-service
//
//  Created by Xuan Yang on 9/30/15.
//  Copyright © 2015 MiraCode. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()  // only request location when app is in use
        self.locationManager.startUpdatingLocation() //START getting the location
        
        print("called viewDidLoad")
        
        
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) -> Void in
            
            
            print("called location manager")
            if error != nil{
                print("Error: " + error!.localizedDescription)
                return // break
            }
            
            if  let pm = placemarks?.first{
                self.displayLocationInfo(pm)
                print("called display location info")
            }
        }
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        
        self.locationManager.stopUpdatingLocation()
        
        print(placemark.locality)
        print(placemark.addressDictionary)
        print(placemark.postalCode)
        print(placemark.administrativeArea)
        print(placemark.country)
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error: " + error.localizedDescription)
    }
    
    


}

