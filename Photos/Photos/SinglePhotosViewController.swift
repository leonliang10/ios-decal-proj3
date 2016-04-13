//
//  SinglePhotosViewController.swift
//  Photos
//
//  Created by Leon Liang on 4/10/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class SinglePhotosViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var heartIcon: UIImageView!
    
    
//    var photos = [Photo]()
    var photoDetails: UIImage = UIImage()
    var numberOfLikes: Int = 0
    var didLikePhoto: Bool = false
    var username: String = ""
    var postDate: NSDate = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = photoDetails
        numberOfLikesLabel.text = "\(numberOfLikes)" + " Likes"
        usernameLabel.text = username + "'s Photo"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyy"
        dateLabel.text = "Post Date: " + dateFormatter.stringFromDate(postDate)
        
        heartIcon.userInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SinglePhotosViewController.tappedHeartIcon(_:)))
        heartIcon.addGestureRecognizer(tapGesture)
        
    }
    
    func tappedHeartIcon(gestureRecognizer: UITapGestureRecognizer) {
        if didLikePhoto {
            heartIcon.image = UIImage(named: "empty_heart")
            didLikePhoto = false
            numberOfLikesLabel.text = "\(numberOfLikes)" + " Likes"
        } else {
            heartIcon.image = UIImage(named: "filled_heart")
            didLikePhoto = true
            numberOfLikesLabel.text = "\(numberOfLikes+1)" + " Likes"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
