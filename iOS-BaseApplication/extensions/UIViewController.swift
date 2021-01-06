//
//  UIViewController.swift
//  iOS-BaseApplication
//
//  Created by MoNe on 10/17/1399 AP.
//

import Foundation
import UIKit


extension UIViewController {
    
    /**
     Embedding a View Controller inside another View Controller, a.k.a. container views
     */
    func embed(_ vc: UIViewController, in _containerView: UIView? = nil) {
        
        // Use the whole view if no container view is provided.
        let containerView: UIView = _containerView ?? view
        containerView.addSubview(vc.view)
        NSLayoutConstraint.activate([
            vc.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0), vc.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0), vc.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0), vc.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(vc)
        vc.didMove(toParent: self) }}
