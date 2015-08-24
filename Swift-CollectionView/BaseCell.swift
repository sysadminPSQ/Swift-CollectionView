//
//  BaseCell.swift
//  Swift-CollectionView
//
//  Created by Akash on 21/08/15.
//  Copyright (c) 2015 Akash. All rights reserved.
//

import UIKit


class BaseCell: UICollectionViewCell {
    
    
}

class FirstCell: BaseCell {
    
    var textLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 90.0, y: 0.0, width: frame.size.width, height: frame.size.height))
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
class SecondCell: BaseCell {
    
    var textLabel: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/3))
        textLabel.font = UIFont.systemFontOfSize(600)
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
    