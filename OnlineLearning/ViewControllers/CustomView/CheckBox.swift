//
//  CheckBox.swift
//  OnlineLearning
//
//  Created by vinatti on 27/01/2022.
//

import UIKit

class CheckBox: UIButton {
    let checked = UIImage(named: "ic_checked")
    let unchecked = UIImage(named: "ic_unchecked")
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checked, for: .normal)
            } else {
                self.setImage(unchecked, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(onChecked), for: .touchUpInside)
        self.isChecked = false
        self.setImage(unchecked, for: .normal)
    }
    
    @objc func onChecked() {
        if isChecked == true {
            isChecked = false
        } else {
            isChecked = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
