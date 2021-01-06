//
//  CGSize.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import UIKit



extension CGSize {
    
    /**
     Padding a UIButton
     @sample:
     class PaddedButton: UIButton {
     override var intrinsicContentSize: CGSize {
     super.intrinsicContentSize.addingPadding(width: 60, height: 20)
        }
     }
     */
    func addingPadding(width: CGFloat, height: CGFloat) -> CGSize {
        CGSize(width: self.width + width, height: self.height + height)
    }
    
}
