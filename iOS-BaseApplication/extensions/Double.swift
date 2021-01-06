//
//  Double.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation


/**
 @sample: let a = 15.78.toInt()
 */
extension Double {
    
    /**
     @sample: 15.67.toInt()
     */
    func toInt() -> Int {
        Int(self)
    }
    
    /**
     @sample: 15.67.toString()
     */
    func toString() -> String {
            String(format: "%.02f", self)
        }
    
    /**
     @sample: 15.67.toPrice(currency: "€")
     */
    func toPrice(currency: String) -> String {
            let nf = NumberFormatter()
            nf.decimalSeparator = ","
            nf.groupingSeparator = "."
            nf.groupingSize = 3
            nf.usesGroupingSeparator = true
            nf.minimumFractionDigits = 2
            nf.maximumFractionDigits = 2
            return (nf.string(from: NSNumber(value: self)) ?? "?") + currency
        }
}
