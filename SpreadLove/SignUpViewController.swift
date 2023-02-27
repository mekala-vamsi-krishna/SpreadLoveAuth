//
//  SignUpViewController.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 26/02/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

class SignUpViewController: UIViewController {
    @IBOutlet var titleTextLabel: UILabel!
    @IBOutlet var avatar: UIImageView!
    @IBOutlet var fullnameContainerView: UIView!
    @IBOutlet var fullnameTextfield: UITextField!
    @IBOutlet var emailContainerView: UIView!
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordContainerView: UIView!
    @IBOutlet var passwordTexfield: UITextField!
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var signinButton: UIButton!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    func setupUI() {
        setupTitleLabel()
        setupAvatar()
        setupFullnameTextfield()
        setupEmailTextfield()
        setupPasswordTextfield()
        setupSignUpButton()
        setupSignInButton()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        self.validateFields()
        self.signUp {
            // Switch
        } onError: { errorMessage in
            ProgressHUD.showError(errorMessage)
        }

    }
}
