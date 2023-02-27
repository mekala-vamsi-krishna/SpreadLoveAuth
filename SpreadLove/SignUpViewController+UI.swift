//
//  SignUpViewController+UI.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 26/02/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

extension SignUpViewController {
    
    func setupTitleLabel() {
        let title = "Sign Up"
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor: UIColor.black])
        
        titleTextLabel.attributedText = attributedText
    }
    
    func setupAvatar() {
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        avatar.isUserInteractionEnabled = true
        avatar.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        avatar.addGestureRecognizer(tapGesture)
    }
    
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true)
    }

    func setupFullnameTextfield() {
        fullnameContainerView.layer.borderWidth = 1
        fullnameContainerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        fullnameContainerView.layer.cornerRadius = 3
        fullnameContainerView.clipsToBounds = true
        
        let attrPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        fullnameTextfield.attributedPlaceholder = attrPlaceholder
        fullnameTextfield.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        fullnameTextfield.borderStyle = .none
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
        passwordTexfield.attributedPlaceholder = attrPlaceholder
        passwordTexfield.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        passwordTexfield.borderStyle = .none
        passwordTexfield.isSecureTextEntry = true
    }
    
    func setupSignUpButton() {
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        signupButton.backgroundColor = UIColor.black
        signupButton.layer.cornerRadius = 5
        signupButton.clipsToBounds = true
        signupButton.setTitleColor(.white, for: .normal)
    }
    
    func setupSignInButton() {
        let attributedText = NSMutableAttributedString(string: "Already have an account?   ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        let attributedSubText = NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        attributedText.append(attributedSubText)
        signinButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func validateFields() {
        guard let username = self.fullnameTextfield.text, !username.isEmpty else {
            ProgressHUD.showError("Please enter username")
            return
        }
        
        guard let email = self.emailTextfield.text, !email.isEmpty else {
            ProgressHUD.showError("Pleade enter email")
            return
        }
        
        guard let password = self.passwordTexfield.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter password")
            return
        }
    }
    
    func signUp(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        ProgressHUD.show()
        Api.user.signUp(with: self.fullnameTextfield.text!, email: self.emailTextfield.text!, password: self.passwordTexfield.text!, image: self.image) {
            ProgressHUD.dismiss()
            onSuccess()
        } onError: { errorMessage in
            onError(errorMessage)
        }
    }
    
}


extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = imageSelected
            avatar.image = imageSelected
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = imageOriginal
            avatar.image = imageOriginal
        }
        picker.dismiss(animated: true)
    }
}
