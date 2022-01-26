//
//  UITextField.swift
//  OnlineLearning
//
//  Created by vinatti on 26/01/2022.
//

import UIKit

extension UITextField {
    
    func borderTextField(_ placeholder: String){
        self.placeholder = placeholder
        layer.borderColor = Colors.lbColorThird.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 12
        txtConstraint(size: CGSize(width: 0, height: 50))
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 50))
        leftViewMode = .always
        font = UIFont(name: Font.regular, size: 14)
    }
    
    func txtConstraint(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil) {
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
        if size.width != 0 {
            anchor.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchor.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        if let centerX = centerX {
            anchor.centerX = centerXAnchor.constraint(equalTo: centerX)
        }
        if let centerY = centerY {
            anchor.centerY = centerYAnchor.constraint(equalTo: centerY)
        }
        [anchor.top, anchor.left, anchor.bottom, anchor.right, anchor.centerX, anchor.centerY, anchor.width, anchor.height].forEach { $0?.isActive = true }
    }
}
