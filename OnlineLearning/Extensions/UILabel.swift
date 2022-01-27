//
//  UILabel.swift
//  OnlineLearning
//
//  Created by vinatti on 24/01/2022.
//

import UIKit

struct AnchorConstraints {
    var top, left, bottom, right, width, height, centerX, centerY: NSLayoutConstraint?
}

extension UILabel {
    
    func text2Regular14(){
        textColor = Colors.lbColorSecond
        font = UIFont(name: Font.regular, size: 14)
    }
    
    func text2Regular12(){
        textColor = Colors.lbColorSecond
        font = UIFont(name: Font.regular, size: 12)
    }
    
    func text3Regular12(){
        textColor = Colors.lbColorThird
        font = UIFont(name: Font.regular, size: 12)
    }
    
    func text1Semi32(){
        textColor = Colors.lbColorFirst
        font = UIFont(name: Font.semibold, size: 32)
    }
    
    func text1Medium18(){
        textColor = Colors.lbColorFirst
        font = UIFont(name: Font.medium, size: 18)
    }
    
    func labelConstraint(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil) {
        var anchor = AnchorConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            anchor.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let left = left {
            anchor.left = leftAnchor.constraint(equalTo: left, constant: padding.left)
        }
        if let bottom = bottom {
            anchor.bottom = bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom)
        }
        if let right = right {
            anchor.right = rightAnchor.constraint(equalTo: right, constant: padding.right)
        }
        if let centerX = centerX {
            anchor.centerX = centerXAnchor.constraint(equalTo: centerX)
        }
        if let centerY = centerY {
            anchor.centerY = centerYAnchor.constraint(equalTo: centerY)
        }
        [anchor.top, anchor.left, anchor.bottom, anchor.right, anchor.centerX, anchor.centerY].forEach { $0?.isActive = true }
    }
}
