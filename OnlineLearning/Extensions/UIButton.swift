//
//  UIButton.swift
//  OnlineLearning
//
//  Created by vinatti on 25/01/2022.
//

import UIKit

extension UIButton {
    func buildPrimaryButton(_ title: String?){
        self.backgroundColor = Colors.bluePrimary
        self.layer.cornerRadius = 12
        self.buttonConstraint(size: CGSize(width: 0, height: 50))
        self.titleLabel?.font = UIFont(name: Font.medium, size: 16)
        self.setTitle(title, for: .normal)
    }
    
    func buildSecondaryButton(_ title: String?){
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: Font.medium, size: 16)
        setTitleColor(Colors.bluePrimary, for: .normal)
        self.layer.cornerRadius = 12
        self.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        layer.borderWidth = 1
        layer.borderColor = Colors.bluePrimary.cgColor
    }
    
    func buttonConstraint(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, centerXOffset: CGFloat = 0, centerYOffset: CGFloat = 0){
        var anchored = AnchorConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            anchored.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let left = left {
            anchored.left = leftAnchor.constraint(equalTo: left, constant: padding.left)
        }
        if let bottom = bottom {
            anchored.bottom = bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom)
        }
        if let right = right {
            anchored.right = rightAnchor.constraint(equalTo: right, constant: padding.right)
        }
        if let centerX = centerX {
            anchored.centerX = centerXAnchor.constraint(equalTo: centerX, constant: centerXOffset)
        }
        if let centerY = centerY {
            anchored.centerY = centerYAnchor.constraint(equalTo: centerY, constant: centerYOffset)
        }
        if size.width != 0 {
            anchored.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchored.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        [anchored.top, anchored.left, anchored.bottom, anchored.right, anchored.centerX, anchored.centerY, anchored.width, anchored.height].forEach { $0?.isActive = true }
    }
}
