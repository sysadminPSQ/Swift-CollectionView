//
//  FlickrPhotosViewController.swift
//  FlexCollectionView
//
//  Created by Akash K on 29/07/15.
//  Copyright (c) 2015 pepper square. All rights reserved.
//

import UIKit

extension FlickrPhotosViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // 1
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = textField.bounds
        activityIndicator.startAnimating()
        flickr.searchFlickrForTerm(textField.text) {
            results, error in
            
            //2
            activityIndicator.removeFromSuperview()
            if error != nil {
                println("Error searching : \(error)")
            }
            
            if results != nil {
                //3
                println("Found \(results!.searchResults.count) matching \(results!.searchTerm)")
                self.searches.insert(results!, atIndex: 0)
                
                //4
                self.collectionView?.reloadData()
            }
        }
        
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
}

extension FlickrPhotosViewController : UICollectionViewDataSource {
    
    //1
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return searches.count
    }
    
    //2
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches[section].searchResults.count + 1
    }
    
    //3
    override func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            //1
          
            if indexPath.item < searches[0].searchResults.count {
                
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier(flickrIdentifier, forIndexPath: indexPath) as! FlickrPhotoCell
                
                //2
                let flickrPhoto = photoForIndexPath(indexPath)
                cell.backgroundColor = UIColor.blackColor()
                //3
                cell.imageView.image = flickrPhoto.thumbnail
                
                return cell
                
            } else {
                println("Adding Text Cell")
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier(addMoreIdentifier, forIndexPath: indexPath) as! AddMoreCell
                cell.textView.text = "Add More ..."
                return cell
            }
    }
}

extension FlickrPhotosViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            if indexPath.item < searches[0].searchResults.count {
                let flickrPhoto =  photoForIndexPath(indexPath)
                //2
                if var size = flickrPhoto.thumbnail?.size {
                    size.width += 10
                    size.height += 10
                    return size
                }
                return CGSize(width: 100, height: 100)
            }else {
                return CGSize(width: 100, height: 100)
            }
    }
    
    //3
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
}

class FlickrPhotosViewController: UICollectionViewController {
    
    private let baseIdentifier = "BaseCell"
    private let flickrIdentifier = "FlickrCell"
    private let addMoreIdentifier = "AddMoreCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private var searches = [FlickrSearchResults]()
    private let flickr = Flickr()
    
    override func loadView() {
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewLayout = UICollectionViewLayout()
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        //layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        var fkc = FlickrPhotosViewController()
        
        collectionView!.delegate = self
        collectionView!.dataSource = self
        
        collectionView!.registerClass(FlickrPhotoCell.self, forCellWithReuseIdentifier: "FlickrCell")
        collectionView!.registerClass(AddMoreCell.self, forCellWithReuseIdentifier: "AddMoreCell")
        
        collectionView!.backgroundColor = UIColor.whiteColor()
           }
    
    func photoForIndexPath(indexPath: NSIndexPath) -> FlickrPhoto {
        return searches[indexPath.section].searchResults[indexPath.row]
    }
}



