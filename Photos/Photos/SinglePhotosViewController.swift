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
    
    var photoDetails: UIImage = UIImage()
    var numberOfLikes: String = ""
    var didLikePhoto: Bool = false
    var username: String = ""
    var postDate: NSDate = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = photoDetails
//        numberOfLike.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
