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
    
    func setCollectionHelper(ch: CollectionHelper  ) {
        self.collectionHelper = ch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = self.collectionHelper?.layout()
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout!)
        collectionView.backgroundColor = UIColor.whiteColor()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionHelper!.register(collectionView)
        
        self.view.addSubview(collectionView)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

