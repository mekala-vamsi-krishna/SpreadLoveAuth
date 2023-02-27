//
//  ViewController+UI.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 26/02/23.
//

import UIKit

extension ViewController {
    func setupHeaderLabel() {
        let title = "Create a new account"
        let subTitle = "\n\nTheliyani vyakthulani parichayam cheskondi, pulihora kalapandi, padeyandi..."
        
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor: UIColor.black])
        let attributedSubTitle = NSMutableAttributedString(string: subTitle, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.45)])
        attributedText.append(attributedSubTitle)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
    }
    
    func setupOrLabel() {
        orLabel.text = "Or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 16)
        orLabel.textColor = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment = .center
    }
    
    func setupTermsLabel() {
        let attributedTermsText = NSMutableAttributedString(string: "By clicking Create a new account, you agree to our ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        let attributedSubTermsTitle = NSMutableAttributedString(string: "\nTerms of Service", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(white: 0, alpha: 0.65)])
        attributedTermsText.append(attributedSubTermsTitle)
        
        termsOfServiceLabel.numberOfLines = 0
        termsOfServiceLabel.attributedText = attributedTermsText
    }
    
    func setupFacebookButton() {
        signInFacebookButton.setTitle("Sign in with Facebook", for: .normal)
        signInFacebookButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInFacebookButton.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        signInFacebookButton.layer.cornerRadius = 5
        signInFacebookButton.clipsToBounds = true
//        signInFacebookButton.setImage(UIImage(named: "F"), for: .normal)
//        signInFacebookButton.imageView?.contentMode = .scaleAspectFit
        signInFacebookButton.tintColor = .white
//        signInFacebookButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: -50, bottom: 12, right: 0)
    }
    
    func setupGoogleButton() {
        signInGoogleButton.setTitle("Sign in with Google", for: .normal)
        signInGoogleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        signInGoogleButton.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        signInGoogleButton.layer.cornerRadius = 5
        signInGoogleButton.clipsToBounds = true
//        signInGoogleButton.setImage(UIImage(named: "G"), for: .normal)
//        signInGoogleButton.imageView?.contentMode = .scaleAspectFit
        signInGoogleButton.tintColor = .white
//        signInGoogleButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: -50, bottom: 12, right: 0)
    }
    
    func setupCreateAccountButton() {
        createAccountButton.setTitle("Create a new account", for: .normal)
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        createAccountButton.backgroundColor = UIColor.black
        createAccountButton.layer.cornerRadius = 5
        createAccountButton.clipsToBounds = true
    }
}
