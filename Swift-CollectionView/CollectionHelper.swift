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
    
    func registerclass(cv: UICollectionView, color: UIColor) {
        
        cv.registerClass(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        cv.registerClass(SecondCell.self, forCellWithReuseIdentifier: "SecondCell")
        cv.backgroundColor = color
        
    }
    
    func layout(top: CGFloat, bottom:CGFloat, left: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) -> UICollectionViewFlowLayout {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        layout.itemSize = CGSize(width: width, height: height)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.minimumInteritemSpacing = 20.0
        layout.minimumLineSpacing = 20.0
        
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
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = uicolorFromHex(0x181818).CGColor
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