//
//  UIDevice.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation

import UIKit
import AudioToolbox

extension UIDevice {
    
    /**
     @sample:
     UIDevice.vibrate()
     */
    static func vibrate() {
        AudioServicesPlaySystemSound(1519)
    }
}
