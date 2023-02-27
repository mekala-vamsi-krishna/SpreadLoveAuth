//
//  SignInViewController+UI.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 26/02/23.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import ProgressHUD

extension SignInViewController {
    
    func setupTitleLabel() {
        let title = "Sign In"
        
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
    
    func setupPasswordTextfield() {
        passwordContainerView.layer.borderWidth = 1
        passwordContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        passwordContainerView.layer.cornerRadius = 3
        passwordContainerView.clipsToBounds = true
        
        let attrPlaceholder = NSAttributedString(string: "Password (8+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        passwordTextfield.attributedPlaceholder = attrPlaceholder
        passwordTextfield.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        passwordTextfield.borderStyle = .none
        passwordTextfield.isSecureTextEntry = true
    }
    
    func setupSignInButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        signInButton.backgroundColor = UIColor.black
        signInButton.layer.cornerRadius = 5
        signInButton.clipsToBounds = true
        signInButton.setTitleColor(.white, for: .normal)
    }
    
    func setupSignUpButton() {
        let attributedText = NSMutableAttributedString(string: "Don't have an account?   ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        let attributedSubText = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        attributedText.append(attributedSubText)
        signUpButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    func setupForgotPasswordButton() {
        let attributedText = NSMutableAttributedString(string: "Forgot Password?", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        forgotPasswordButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    func validateFields() {
        guard let email = self.emailTextfield.text, !email.isEmpty else {
            ProgressHUD.showError("Pleade enter email")
            return
        }
        
        guard let password = self.passwordTextfield.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter password")
            return
        }
    }
    
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        ProgressHUD.show()
        Api.user.signIn(email: self.emailTextfield.text!, password: self.passwordTextfield.text!) {
            onSuccess()
        } onError: { errorMessage in
            onError(errorMessage)
        }
    }

}
