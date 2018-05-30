//
//  PostCell.swift
//  devslopes-showcase-dev
//
//  Created by Mark Price on 8/24/15.
//  Copyright © 2015 devslopes. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class PostCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var appImg: UIImageView!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var request: Request?
    var likeRef: Firebase!
    
    private var _post: Post?
    
    var post: Post? {
        return _post
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: "likeTapped:")
        tap.numberOfTapsRequired = 1
        likeImg.addGestureRecognizer(tap)
        likeImg.userInteractionEnabled = true
        
        
    }
    
    override func drawRect(rect: CGRect) {
        userImg.layer.cornerRadius = userImg.frame.size.width / 2
        userImg.clipsToBounds = true
        appImg.clipsToBounds = true
        likeImg.layer.cornerRadius = likeImg.frame.size.width / 2
        likeImg.clipsToBounds = true
    }

    func configureCell(post: Post, img: UIImage?) {
        
        //Clear existing image (because its old)
        self.appImg.image = nil
        self._post = post
        self.likeRef = DataService.ds.REF_USER_CURRENT.childByAppendingPath("likes").childByAppendingPath(post.postKey)
        
        if let desc = post.postDescription where post.postDescription != "" {
            self.descriptionText.text = desc
        } else {
            self.descriptionText.hidden = true
        }
        
        self.likesLbl.text = "\(post.likes)"
        
        if post.imageUrl != nil {
            //Use the cached image if there is one, otherwise download the image
            if img != nil {
                appImg.image = img!
            } else {
                //Must store the request so we can cancel it later if this cell is now out of the users view
                request = Alamofire.request(.GET, post.imageUrl!).validate(contentType: ["image/*"]).response(completionHandler: { request, response, data, err in
                    
                    if err == nil {
                        let img = UIImage(data: data!)!
                        self.appImg.image = img
                        FeedVC.imageCache.setObject(img, forKey: self.post!.imageUrl!)
                    }
                })
            }
            
        } else {
            self.appImg.hidden = true
        }
        
        
        //Grab the current users likes and see if the current post has been liked
        likeRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if let doesNotExist = snapshot.value as? NSNull {
                self.likeImg.image = UIImage(named: "heart-empty")
            } else {
                self.likeImg.image = UIImage(named: "heart-full")
            }
        })
        
    }
    
    
    func likeTapped(sender: UITapGestureRecognizer) {
        
        likeRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            //If I haven't like this, then like it, otherwise un-like it
            if let doesNotExist = snapshot.value as? NSNull {
                self.likeRef.setValue(true)
                self.likeImg.image = UIImage(named: "heart-full")
                self.post!.adjustLikes(true)
                
            } else {
                self.likeRef.removeValue()
                self.likeImg.image = UIImage(named: "heart-empty")
                self.post!.adjustLikes(false)
            }
            
            self.likesLbl.text = "\(self.post!.likes)"
        })
    }

}
