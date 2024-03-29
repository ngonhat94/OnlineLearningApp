//
//  UIImage.swift
//  OnlineLearning
//
//  Created by Ngo Duy Nhat on 24/01/2022.
//

import UIKit

extension UIImage {
    func resized(to target: CGSize) -> UIImage {
        let ratio = min(
            target.height / size.height, target.width / size.width
        )
        let new = CGSize(
            width: size.width * ratio, height: size.height * ratio
        )
        let renderer = UIGraphicsImageRenderer(size: new)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: new))
        }
    }
}
