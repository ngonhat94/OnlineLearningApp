//
//  ContinueWithPhoneVC.swift
//  OnlineLearning
//
//  Created by vinatti on 27/01/2022.
//

import UIKit

class ContinueWithPhoneVC: UIViewController {
    
    let lbHeaderTitle = UILabel()
    let backButton = UIButton()
    let imgPhoneOtp = UIImageView()
    let lbEnterPhone = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundPrimary
        setupView()
        setupConstraint()
    }
    
    func setupView(){
        lbHeaderTitle.text = "Continue with Phone"
        lbHeaderTitle.text1Medium18()
        backButton.setImage(UIImage(named: "ic_arrow_left"), for: .normal)
        imgPhoneOtp.image = UIImage(named: "phone_otp")
        lbEnterPhone.text = "Enter Your  Phone Number"
        lbEnterPhone.text2Regular14()
        
        view.addSubview(lbHeaderTitle)
        view.addSubview(backButton)
        view.addSubview(imgPhoneOtp)
        view.addSubview(lbEnterPhone)
    }
    
    func setupConstraint(){
        lbHeaderTitle.labelConstraint(top: view.safeAreaLayoutGuide.topAnchor, padding: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0), centerX: view.centerXAnchor)
        backButton.buttonConstraint(left: view.leftAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), centerY: lbHeaderTitle.centerYAnchor)
        imgPhoneOtp.imgConstraint(top: lbHeaderTitle.bottomAnchor, padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0), centerX: view.centerXAnchor)
        lbEnterPhone.labelConstraint(top: imgPhoneOtp.bottomAnchor, padding: UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0), centerX: view.centerXAnchor)
    }
}
