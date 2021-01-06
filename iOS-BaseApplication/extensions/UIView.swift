//
//  UIView.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation
import UIKit


extension UIView {
    
    /**
     Finding superviews with a given type
     Have you ever wanted to access your table view cell from a textfield which is embedded in that cell? Maybe access the collection view from a collection view cell subclass?
     @sample:
     func textFieldDidBeginEditing(_ textField: UITextField) {
     // Get the cell containing the textfield.
     if let cell = textField.superview(of: TextFieldTableViewCell.self) {
     cell.toggle(isHighlighted: true)
        }
     }
     */
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: type) }
    }
    
}
