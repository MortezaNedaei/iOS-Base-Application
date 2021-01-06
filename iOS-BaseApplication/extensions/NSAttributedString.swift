//
//  NSAttributedString.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation
import UIKit

/**
 iOS can calculate the size of UILabel automatically, using provided constraints, but sometimes it’s important to set the size yourself.
 This extension allows us to calculate the String width and height using the provided UIFont
 @sample:
 let text = "Hello, world!"
 let textHeight = text.height(withConstrainedWidth: 100, font: UIFont.systemFont(ofSize: 16))
 */
extension NSAttributedString {
    
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
}
