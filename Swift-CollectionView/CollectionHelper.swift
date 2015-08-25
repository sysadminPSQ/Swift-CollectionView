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
    
    var collectionList: [BaseCell]
    var addButton: BaseCell?
    
    init(collectionList: [BaseCell], addButton: BaseCell?) {
        
        self.collectionList = collectionList
        self.addButton = addButton
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
        //cell.imageView.image = UIImage(named: "Vaccum.jpg")
        return cell
    }
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
}