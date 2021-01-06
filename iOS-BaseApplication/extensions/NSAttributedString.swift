//
//  NSAttributedString.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation
import UIKit


extension NSAttributedString {
    
    /**
     iOS can calculate the size of UILabel automatically, using provided constraints, but sometimes it’s important to set the size yourself.
     This extension allows us to calculate the String width and height using the provided UIFont
     @sample:
     let text = "Hello, world!"
     let textHeight = text.height(withConstrainedWidth: 100, font: UIFont.systemFont(ofSize: 16))
     */
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.width)
    }
    
    /**
     Highlighting parts of a String in UILabel
     @sample:
     label.attributedText = NSAttributedString(string: "Budapest")label.attributedText = label.attributedText?.highlighting("Bud", using: .blue)
     */
    func highlighting(_ substring: String, using color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        attributedString.addAttribute(.foregroundColor, value: color, range: (self.string as NSString).range(of: substring))
        return attributedString
    }
        
}
