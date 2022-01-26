//
//  UIStackView.swift
//  OnlineLearning
//
//  Created by vinatti on 25/01/2022.
//
import UIKit

extension UIStackView {
    func stackConstraint(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil) {
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

