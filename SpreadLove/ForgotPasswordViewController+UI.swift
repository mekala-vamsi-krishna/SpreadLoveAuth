//
//  ForgotPasswordViewController+UI.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 26/02/23.
//

import UIKit

extension ForgotPasswordViewController {
    
    func setupTitleLabel() {
        let title = "Forgot Password?"
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor: UIColor.black])
        
        titleLabel.attributedText = attributedText
    }
    
    func setupEmailTextfield() {
        emailContainerView.layer.borderWidth = 1
        emailContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        emailContainerView.layer.cornerRadius = 3
        emailContainerView.clipsToBounds = true
        
        let attrPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        emailTextfield.attributedPlaceholder = attrPlaceholder
        emailTextfield.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        emailTextfield.borderStyle = .none
        emailTextfield.keyboardType = .emailAddress
    }
    
    func setupResetMyPasswordButton() {
        resetMyPasswordButton.setTitle("Reset My Password", for: .normal)
        resetMyPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        resetMyPasswordButton.backgroundColor = UIColor.black
        resetMyPasswordButton.layer.cornerRadius = 5
        resetMyPasswordButton.clipsToBounds = true
        resetMyPasswordButton.setTitleColor(.white, for: .normal)
    }
}
