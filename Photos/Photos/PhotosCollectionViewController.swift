//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    var photos: [Photo]!
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)!
        let photoData = NSData(contentsOfURL: url)!
        let image = UIImage(data: photoData)
        imageView.image = image
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView,
                                 cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotosCollectionViewCell
        
        if photos != nil{
            let url = NSURL(string: photos[indexPath.row].url)!
            
            let data = NSData(contentsOfURL: url)!
            
            let image = UIImage(data: data)
            //let image = UIImage(named: carImages[indexPath.row])
            photoCell.imageViewCell.image = image
        }
        
        return photoCell
    }
    
    override func numberOfSectionsInCollectionView(collectionView:
        UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        if photos == nil{
            return 0
        } else{
            return photos.count
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowSinglePhoto") {
            let singlePhotosViewController = segue.destinationViewController as! SinglePhotosViewController
            if let cell = sender as? UICollectionViewCell, indexPath = collectionView!.indexPathForCell(cell) {
                // use indexPath
                
                singlePhotosViewController.photoDetails = UIImage(data: NSData(contentsOfURL: NSURL(string: photos[indexPath.row].url)!)!)!
                singlePhotosViewController.numberOfLikes = photos[indexPath.row].likes
                singlePhotosViewController.username = photos[indexPath.row].username
                singlePhotosViewController.postDate = photos[indexPath.row].postDate
            }
        }
    }
    
}

