//
//  Date.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation


extension Date {
    
    /**
     @sample:
     let strDate = "2020-08-10 15:00:00"
     let strDate = date?.toString(format: "yyyy-MM-dd HH:mm:ss")
     */
    func toString(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
    
}
