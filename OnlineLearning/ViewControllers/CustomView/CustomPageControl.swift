//
//  CustomPageControl.swift
//  OnlineLearning
//
//  Created by vinatti on 25/01/2022.
//

import UIKit

class CustomPageControl: UIPageControl {
    
    fileprivate let inactiveDotFrame = CGRect(origin: .zero, size: CGSize(width: 28, height: 5))
    fileprivate let activeDotFrame = CGRect(origin: .zero, size: CGSize(width: 9, height: 5))
    fileprivate let dotPadding: CGFloat = 9
    
    override func awakeFromNib() {
         super.awakeFromNib()
         self.clipsToBounds = false
    }
    
    override var numberOfPages: Int {
        didSet {
            updateDots()
        }
    }
    
    override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    private func updateDots() {
        guard !subviews.isEmpty else { return }
        
        let spacing: CGFloat = 100
        let width: CGFloat = 10
        let height: CGFloat = 5
        
        var total: CGFloat = 0
        
        for view in subviews {
            view.layer.cornerRadius = 2.5
            view.frame = CGRect(x: total, y: 0, width: width, height: height)//x: total, y: frame.size.height / 2 - height / 2, width: width, height: height
            total += width + spacing
        }
        
        total -= spacing
        
        frame.origin.x = frame.origin.x + frame.size.width / 2 - total / 2
        frame.size.width = total
    }
}
