//
//  LoginVC.swift
//  OnlineLearning
//
//  Created by vinatti on 25/01/2022.
//

import UIKit

class LoginVC: UIViewController {
    var formSignIn = FormSignUpSignIn()
    let lbTitle: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lbColorFirst
        label.font = UIFont(name: Font.semibold, size: 32)
        label.text = "Log In"
        return label
    }()
    let lbForgetPassword = UILabel()
    let btnLogin = UIButton()
    let lbNoAccountAndSignup = UILabel()
    let lbLoginWith = UILabel()
    let lineViewLoginWith = UIView()
    let lineViewLoginWithRight = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundPrimary
        setupView()
        setupConstraint()
    }
    
    func setupView(){
        formSignIn.delegate = self
        
        lbForgetPassword.text2Regular14()
        lbForgetPassword.text = "Forget password?"
        btnLogin.buildPrimaryButton("Log In")
        
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: Font.regular, size: 12.0)!, NSAttributedString.Key.foregroundColor: Colors.lbColorSecond ]
        let myString = NSMutableAttributedString(string: "Don’t have an account? Sign up", attributes: myAttribute )
        let signupRange = NSRange(location: 23, length: 7)
        myString.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.bluePrimary, range: signupRange)
        lbNoAccountAndSignup.attributedText = myString
        lbLoginWith.text2Regular12()
        lbLoginWith.text = "Or login with"
        lineViewLoginWith.backgroundColor = Colors.lbColorSecond
        lineViewLoginWithRight.backgroundColor = Colors.lbColorSecond
        
        view.addSubview(lbTitle)
        view.addSubview(formSignIn)
        view.addSubview(lbForgetPassword)
        view.addSubview(btnLogin)
        view.addSubview(lbNoAccountAndSignup)
        view.addSubview(lbLoginWith)
        view.addSubview(lineViewLoginWith)
        view.addSubview(lineViewLoginWithRight)
    }
    
    func setupConstraint(){
        lbTitle.labelConstraint(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        formSignIn.viewConstraint(top: lbTitle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: -20))
        lbForgetPassword.labelConstraint(top: formSignIn.bottomAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: -20))
        btnLogin.buttonConstraint(top: lbForgetPassword.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        lbNoAccountAndSignup.labelConstraint(top: btnLogin.bottomAnchor, padding: UIEdgeInsets(top: 22, left: 0, bottom: 0, right: 0), centerX: view.centerXAnchor)
        lbLoginWith.labelConstraint(top: lbNoAccountAndSignup.bottomAnchor, padding: UIEdgeInsets(top: 22, left: 0, bottom: 0, right: 0), centerX: view.centerXAnchor)
        lineViewLoginWith.viewConstraint(left: view.leftAnchor, right: lbLoginWith.leftAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20), size: CGSize(width: 0, height: 0.5), centerY: lbLoginWith.centerYAnchor)
        lineViewLoginWithRight.viewConstraint(left: lbLoginWith.rightAnchor, right: view.rightAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20), size: CGSize(width: 0, height: 0.5), centerY: lbLoginWith.centerYAnchor)
    }
}

extension LoginVC: FormSignUpInDelegate {
    func dataInput(email: String?, password: String?) {
        print("email: \(email ?? ""), password: \(password ?? "")")
    }
}
