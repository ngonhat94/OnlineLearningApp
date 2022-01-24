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
        img.backgroundColor = .cyan
        return img
    }()
    let lbTitle: UILabel = {
        let lb = UILabel()
        lb.textColor = Colors.lbColorFirst
        lb.font = UIFont(name: Font.semibold, size: 22)
        return lb
    }()
    let lbDescription = UILabel()
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
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStack.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentStack.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
