//
//  ForgotPasswordViewController.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 26/02/23.
//

import UIKit
import ProgressHUD

class ForgotPasswordViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emailContainerView: UIView!
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var resetMyPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        setupTitleLabel()
        setupEmailTextfield()
        setupResetMyPasswordButton()
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetMyPasswordTapped(_ sender: UIButton) {
        guard let email = self.emailTextfield.text, email != "" else {
            ProgressHUD.showError("Please enter email address for password reset")
            return
        }
        
        Api.user.resetPassword(email: self.emailTextfield.text!) {
            self.view.endEditing(true)
            ProgressHUD.showSucceed()
            self.navigationController?.popViewController(animated: true)
        } onError: { errorMessage in
            ProgressHUD.showError(errorMessage)
        }

    }
}
