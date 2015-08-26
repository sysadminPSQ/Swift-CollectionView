//
//  CollectionHelper.swift
//  Swift-CollectionView
//
//  Created by Akash on 25/08/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

import Foundation
import UIKit

class CollectionHelper {
    
    var collectionList: Int
    var addButton: Bool
    
    init(collectionList: Int, addButton: Bool) {
        
        self.collectionList = collectionList
        self.addButton = addButton
    }
    
    func register(cv: UICollectionView){
        
        cv.registerClass(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        cv.registerClass(SecondCell.self, forCellWithReuseIdentifier: "SecondCell")
        
    }
    
    func layout() -> UICollectionViewFlowLayout {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 200, left: 35, bottom: 500, right: 35)
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        return layout
    }
    
    func addCellFn (collectionView: UICollectionView, indexPath: NSIndexPath) -> UICollectionViewCell  {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FirstCell", forIndexPath: indexPath) as! FirstCell
        cell.backgroundColor = uicolorFromHex(0x0976b8)
        cell.textLabel.text = "1001"
        cell.imageView.image = UIImage(named: "Vaccum.jpg")
        return cell
        
    }
    
    func addPlusFn(collectionView: UICollectionView, indexPath: NSIndexPath) -> UICollectionViewCell  {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SecondCell", forIndexPath: indexPath) as! SecondCell
        cell.backgroundColor = uicolorFromHex(0xffffff)
        cell.textLabel.text = "+"
        return cell
    }
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
}