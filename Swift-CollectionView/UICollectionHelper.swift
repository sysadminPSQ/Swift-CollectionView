//
//  UICollectionHelper.swift
//  Swift-CollectionView
//
//  Created by Akash on 27/08/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

import UIKit

class UICollectionHelper {
    
    func layout(top: CGFloat, bottom:CGFloat, left: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) -> UICollectionViewFlowLayout { return layout(top, bottom: bottom, left: left, right: right, width: width, height: height)}
    func registerclass(cv: UICollectionView, color: UIColor) {}
    func addCell() {}
}
class RoomTypeCollectionHelper: UICollectionHelper {
    
    override func layout(top: CGFloat, bottom:CGFloat, left: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) -> UICollectionViewFlowLayout {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        layout.itemSize = CGSize(width: width, height: height)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        layout.minimumInteritemSpacing = 20.0
        layout.minimumLineSpacing = 20.0
        
        return layout
    }
    
    override func registerclass(cv: UICollectionView, color: UIColor) {
        
        cv.registerClass(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        cv.registerClass(SecondCell.self, forCellWithReuseIdentifier: "SecondCell")
        cv.backgroundColor = color
        
    }
    
    
    
    
}

