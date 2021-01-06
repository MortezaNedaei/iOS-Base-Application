//
//  Array.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation

extension Array {
    
    /**
     Subscripting Array using an IndexPath
     */
    subscript(indexPath: IndexPath) -> Element {
        self[indexPath.row]
    }
    
}
