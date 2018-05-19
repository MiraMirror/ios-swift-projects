//
//  ViewController.swift
//  WhatFlower
//
//  Created by Xuan Yang on 1/23/18.
//  Copyright © 2018 Miraco. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var userPickedImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let imagePicker = UIImagePickerController()
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = true
        
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIBarButtonItem) {

        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let userPickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("Cannot convert UIImage to CIImage.")
            }
            
            detect(ciImage: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(ciImage : CIImage) {
        
        guard let model = try? VNCoreMLModel(for : FlowerClassifier().model) else {
            fatalError("Cannot implement FlowerClassifier model.")
        }
        
        let request = VNCoreMLRequest(model : model) { (request, error) in
            
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("Cannot import model.")
            }
            
            let flowerName = classification.identifier.capitalized
            self.navigationItem.title = flowerName
            
            let parameters : [String:String] = [
                "format" : "json",
                "action" : "query",
                "prop" : "extracts|pageimages",
                "exintro" : "",
                "explaintext" : "",
                "titles" : flowerName,
                "indexpageids" : "",
                "redirects" : "1",
                "pithumbsize" : "500"
            ]
        
            self.getDescription(url: self.wikipediaURL, parameters: parameters)

        }
        
        let handler = VNImageRequestHandler(ciImage : ciImage)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }

    }
    
    func getDescription(url : String, parameters : [String : String]) {
        
        Alamofire.request(wikipediaURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON {
            (response) in
            
            if response.result.isSuccess {
                
                let wikiJSON : JSON = JSON(response.result.value!)
                let pageid = wikiJSON["query"]["pageids"][0].stringValue
                let flowerDescription = wikiJSON["query"]["pages"][pageid]["extract"].stringValue
                let flowerImageURL = wikiJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                
                self.descriptionLabel.text = flowerDescription
                self.userPickedImageView.sd_setImage(with: URL(string: flowerImageURL))
                
                
            } else {
                print("Error: \(response.result.error)")
            }
        }
        
    }
    
}

