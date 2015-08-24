//
//  BaseCell.swift
//  Swift-CollectionView
//
//  Created by Akash on 21/08/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

import UIKit

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

class BaseCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    var imageView: UIImageView!
    
    var origin = Point()
    var size = Size()

    convenience init(origin: Point, size: Size) {
        
        self.init(origin: origin, size: size)
    }
    
    convenience init(center: Point, size: Size) {
        
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
        
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/3))
        textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
