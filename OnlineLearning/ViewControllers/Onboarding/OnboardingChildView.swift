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
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 50))
        lb.textColor = Colors.lbColorSecond
        lb.font = UIFont(name: Font.regular, size: 16)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    let contentStack = UIStackView()
    
    var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentStack()
    }
    
    func setupContentStack(){
        view.addSubview(contentStack)
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.addArrangedSubview(image)
        contentStack.addArrangedSubview(lbTitle)
        contentStack.addArrangedSubview(lbDescription)
        contentStack.axis = NSLayoutConstraint.Axis.vertical
        contentStack.spacing = 20
        NSLayoutConstraint.activate([
//            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            contentStack.leftAnchor.constraint(equalTo: view.leftAnchor),
////            contentStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            contentStack.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lbDescription.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: lbDescription.trailingAnchor, multiplier:4)
        ])
        
//        lbTitle.labelConstraint(top: image.bottomAnchor, left: contentStack.leftAnchor, right: contentStack.rightAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: -40))
    }
}
