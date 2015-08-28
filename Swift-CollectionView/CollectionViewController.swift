//
//  ViewController.swift
//  Swift-CollectionView
//
//  Created by Akash on 20/08/15.
//  Copyright (c) 2015 Akash. All rights reserved.

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    var collectionHelper: CollectionHelper? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionHelper(CollectionHelper(collectionList: 8, addButton: true))
        
        let layout = self.collectionHelper?.layout(200, bottom: 200, left: 0, right: 0, width: 300, height: 300)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout!)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionHelper!.registerclass(collectionView, color: uicolorFromHex(0xffffff))
        
        self.view.addSubview(collectionView)
    }
    
    func setCollectionHelper(ch: CollectionHelper  ) {
        self.collectionHelper = ch
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionHelper!.collectionList + (collectionHelper!.addButton ? 1:0)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.item < collectionHelper!.collectionList {
            
            return collectionHelper!.addCellFn(collectionView, indexPath: indexPath)
        } else {
            
            return  collectionHelper!.addPlusFn(collectionView, indexPath: indexPath)
        }
        
    }
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

