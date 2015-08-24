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
    
    var collectionList: [BaseCell] = []
    var addButton: BaseCell? = nil
    
    var addCellFn : (UICollectionView, NSIndexPath) -> UICollectionViewCell = {
        (cv, ip) in
    }
    var addPlusFn : (UICollectionView, NSIndexPath) -> UICollectionViewCell = {
        (cv, ip) in
        return nil
    }

    
    func setItems(collectionList: [BaseCell], addButton: BaseCell?, addCell: (UICollectionView, NSIndexPath) -> UICollectionViewCell,
        addPlusCell: (UICollectionView, NSIndexPath) -> UICollectionViewCell) {
    
        self.collectionList = collectionList
        self.addButton = addButton
            self.addCellFn = addCell
            self.addPlusFn = addPlusCell
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 200, left: 35, bottom: 500, right: 35)
        layout.itemSize = CGSize(width: 300, height: 300)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView!.registerClass(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        collectionView!.registerClass(SecondCell.self, forCellWithReuseIdentifier: "SecondCell")
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.scrollEnabled = false
        self.view.addSubview(collectionView)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionList.count + ( self.addButton != nil ? 1:0)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        print(indexPath)
        if indexPath.item < self.collectionList.count {
            
           return self.addCellFn(collectionView, indexPath)
        } else {
            
        return   self.addPlusFn(collectionView, indexPath)
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

