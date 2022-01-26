//
//  FormSignUpSignIn.swift
//  OnlineLearning
//
//  Created by vinatti on 26/01/2022.
//

import UIKit

protocol FormSignUpInDelegate: AnyObject {
    func dataInput(email: String?, password: String?)
}

class FormSignUpSignIn: UIView, UITextFieldDelegate {
    weak var delegate: FormSignUpInDelegate?
    let lbEmail = UILabel()
    let txtEmail = UITextField()
    let lbPassword = UILabel()
    let txtPassword = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        self.addSubview(lbEmail)
        self.addSubview(txtEmail)
        self.addSubview(lbPassword)
        self.addSubview(txtPassword)
        setupConstraint()
        txtEmail.addTarget(self, action: #selector(setEmailPassword), for: .editingChanged)
        txtPassword.addTarget(self, action: #selector(setEmailPassword), for: .editingChanged)
    }
    
    func setupView(){
        lbEmail.text = "Your Email"
        lbEmail.text2Regular14()
        txtEmail.borderTextField("Email")
        lbPassword.text = "Password"
        lbPassword.text2Regular14()
        txtPassword.borderTextField("Password")
    }
    
    @objc func setEmailPassword(){
        if let delegate = delegate {
            delegate.dataInput(email: txtEmail.text, password: txtPassword.text)
        }
    }
    
    func setupConstraint() {
        lbEmail.labelConstraint(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor)
        txtEmail.txtConstraint(top: lbEmail.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, padding: UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0))
        lbPassword.labelConstraint(top: txtEmail.bottomAnchor, left: self.leftAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        txtPassword.txtConstraint(top: lbPassword.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor,padding: UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
