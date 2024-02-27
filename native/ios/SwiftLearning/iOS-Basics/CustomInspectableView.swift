//
//  CustomInspectableView.swift
//  SwiftLearning
//
//  Created by Gagan on 09/07/18.
//  Copyright © 2018 Gagan. All rights reserved.
//

import UIKit

@IBDesignable class CustomInspectableView: UIView {
    
    override init(frame: CGRect) {
        cornerRadius = 0;
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        cornerRadius = 0;
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    var cornerRadius : CGFloat {
        didSet{
            self.layer.cornerRadius = cornerRadius;
        }
    }
}
