//
//  ViewController.swift
//  FrameVsBounds
//
//  Created by Greg Heo on 2014-11-16.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var innerView: UIView!
  
  @IBOutlet weak var frameSlider: UISlider!
  @IBOutlet weak var boundsSlider: UISlider!
    @IBOutlet weak var frameYSlider: UISlider!
    @IBOutlet weak var boundsYSlider: UISlider!

  @IBOutlet weak var frameOriginLabel: UILabel!
  @IBOutlet weak var boundsOriginLabel: UILabel!
    @IBOutlet weak var frameOriginYLabel: UILabel!
    @IBOutlet weak var boundsOriginYLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    frameSlider.value = Float(containerView.frame.origin.x)
    boundsSlider.value = Float(containerView.bounds.origin.x)
    frameYSlider.value = Float(containerView.frame.origin.y)
    boundsYSlider.value = Float(containerView.bounds.origin.y)
    
    updateValues()
    
  }

  @IBAction func frameSliderChanged(sender: AnyObject) {
    
    containerView.frame.origin.x = CGFloat(frameSlider.value)
    updateValues()
    
  }

  @IBAction func boundsSliderChanged(sender: AnyObject) {
    
    containerView.bounds.origin.x = CGFloat(boundsSlider.value)
    updateValues()
    
  }

    @IBAction func frameYSliderChanged(sender: AnyObject) {
        containerView.frame.origin.y = CGFloat(frameYSlider.value)
        updateValues()
    }
    
    @IBAction func BoundsYSliderChanged(sender: AnyObject) {
        containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
        updateValues()
    }
    
    private func updateValues(){
        frameOriginLabel.text = "Frame x origin = \(Int(containerView.frame.origin.x))"
        boundsOriginLabel.text = "Bound x origin = \(Int(containerView.bounds.origin.x))"
        frameOriginYLabel.text = "Frame y origin = \(Int(containerView.frame.origin.y))"
        boundsOriginYLabel.text = "Bound y origin = \(Int(containerView.bounds.origin.y))"
    }
    

}
