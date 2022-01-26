//
//  OnboardingChildView.swift
//  OnlineLearning
//
//  Created by vinatti on 24/01/2022.
//

import UIKit

class OnboardingChildView: UIViewController {

    let image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    let lbTitle: UILabel = {
        let lb = UILabel()
        lb.textColor = Colors.lbColorFirst
        lb.font = UIFont(name: Font.semibold, size: 22)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    let lbDescription: UILabel = {
        let lb = UILabel()
        lb.textColor = Colors.lbColorSecond
        lb.font = UIFont(name: Font.regular, size: 16)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    let contentStack = UIStackView()
    let descriptionView: UIView = {
        let view = UIView()
        return view
    }()
    
    var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
    }
    
    func setupView(){
        contentStack.addArrangedSubview(image)
        contentStack.addArrangedSubview(lbTitle)
        contentStack.addArrangedSubview(lbDescription)
        view.addSubview(contentStack)
        contentStack.axis = NSLayoutConstraint.Axis.vertical
    }
    func setupConstraint(){
        contentStack.stackConstraint(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
        image.imgConstraint(size: CGSize(width: 260, height: 260))
        contentStack.spacing = 24
    }
}
