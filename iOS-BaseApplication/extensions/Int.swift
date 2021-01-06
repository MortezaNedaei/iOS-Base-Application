//
//  Int.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation

extension Int {
    
    /**
     @sample: 15.toString()
     */
    func toString() -> String {
        "\(self)"
    }
    
    func toDouble() -> Double {
        Double(self)
    }
    
    /**
     @sample:
     let cents = 12350
     let dollars = cents.centsToDollars()
     */
    func centsToDollars() -> Double {
            Double(self) / 100
    }
    
    
    func toColor(alpha: Float = 1.0) -> UniColor? {
            UniColor(hex: self, alpha: alpha)
        }
    
    func duplicate4bits() -> Int {
            return (self << 4) + self
        }
    
}
