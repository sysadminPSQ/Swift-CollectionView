//
//  FlickrPhotoCellCollectionViewCell.swift
//  FlexCollectionView
//
//  Created by Akash K on 29/07/15.
//  Copyright (c) 2015 pepper square. All rights reserved.
//

import UIKit


class FlickrPhotoCell: BaseCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        self.contentView.addSubview(imageView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AddMoreCell: BaseCell {
    
    var textView: UITextField!
    override init(frame: CGRect) {
        super.init(frame: frame)
        textView = UITextField()
        self.contentView.addSubview(textView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BaseCell: UICollectionViewCell {
}

