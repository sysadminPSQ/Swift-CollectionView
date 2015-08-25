//
//  ViewController.swift
//  Swift-CollectionView
//
//  Created by Akash on 20/08/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    let collectionHelper = CollectionHelper(collectionList: [], addButton: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 200, left: 35, bottom: 500, right: 35)
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.registerClass(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        collectionView!.registerClass(SecondCell.self, forCellWithReuseIdentifier: "SecondCell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionHelper.collectionList.count + (collectionHelper.addButton != nil ? 1:0)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.item < collectionHelper.collectionList.count {
            
           return collectionHelper.addCellFn(collectionView, indexPath)
        } else {
            
        return   collectionHelper.addPlusFn(collectionView, indexPath)
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

