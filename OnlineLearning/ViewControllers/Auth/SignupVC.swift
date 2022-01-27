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
        label.text = "Sign Up"
        return label
    }()
    let lbSubTitle: UILabel = {
        let lb = UILabel()
        lb.text = "Enter your details below & free sign up"
        return lb
    }()
    let formSignUp = FormSignUpSignIn()
    let signUpButton = UIButton()
    var checkBox = CheckBox()
    let lbTerm = UILabel()
    let lbHaveAccount = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundPrimary
        setupView()
        setupConstraint()
    }
    
    func setupView(){
        lbTitle.text1Semi32()
        lbSubTitle.text3Regular12()
        signUpButton.buildPrimaryButton("Create account")
        lbTerm.text2Regular12()
        lbTerm.text = "By creating an account you have to agree with our them & condication."
        lbTerm.numberOfLines = 0
        lbHaveAccount.text = "Already have an account?"
        lbHaveAccount.text2Regular12()

        view.addSubview(lbTitle)
        view.addSubview(lbSubTitle)
        view.addSubview(formSignUp)
        view.addSubview(signUpButton)
        view.addSubview(checkBox)
        view.addSubview(lbTerm)
        view.addSubview(lbHaveAccount)
    }
    
    func setupConstraint(){
        lbTitle.labelConstraint(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, padding: UIEdgeInsets(top: 100, left: 20, bottom: 0, right: 0))
        lbSubTitle.labelConstraint(top: lbTitle.bottomAnchor, left: view.leftAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        formSignUp.viewConstraint(top: lbSubTitle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 26, left: 20, bottom: 0, right: -20))
        signUpButton.buttonConstraint(top: formSignUp.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: -20))
        checkBox.buttonConstraint(top: signUpButton.bottomAnchor, left: view.leftAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
        lbTerm.labelConstraint(top: signUpButton.bottomAnchor, left: checkBox.rightAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 22, left: 6, bottom: 0, right: -35))
        lbHaveAccount.labelConstraint(top: lbTerm.bottomAnchor, left: view.leftAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
    }
}
