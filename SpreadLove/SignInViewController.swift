//
//  SingInViewController.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 26/02/23.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emailContainerView: UIView!
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordContainerView: UIView!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        setupTitleLabel()
        setupEmailTextfield()
        setupPasswordTextfield()
        setupSignInButton()
        setupSignUpButton()
        setupForgotPasswordButton()
    }
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        self.validateFields()
        self.signIn {
            //switch
        } onError: { errorMessage in
            ProgressHUD.showError(errorMessage)
        }

    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
    }
}
