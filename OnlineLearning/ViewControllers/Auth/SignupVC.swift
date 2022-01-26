//
//  SignupVC.swift
//  OnlineLearning
//
//  Created by vinatti on 25/01/2022.
//

import UIKit

class SignupVC: UIViewController {
    
    let lbTitle: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lbColorFirst
        label.font = UIFont(name: Font.semibold, size: 32)
        return label
    }()
    let lbSubTitle: UILabel = {
        let lb = UILabel()
        lb.text = "Enter your details below & free sign up"
        lb.font = UIFont(name: Font.regular, size: 12)
        lb.textColor = Colors.lbColorThird
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundPrimary
        setupView()
        setupConstraint()
    }
    
    func setupView(){
        view.addSubview(lbTitle)
    }
    
    func setupConstraint(){
        lbTitle.labelConstraint(top: view.topAnchor, left: view.leftAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
}
