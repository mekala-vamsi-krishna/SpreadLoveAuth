//
//  ViewController.swift
//  SpreadLove
//
//  Created by Mekala Vamsi Krishna on 25/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var signInFacebookButton: UIButton!
    @IBOutlet var signInGoogleButton: UIButton!
    @IBOutlet var createAccountButton: UIButton!
    @IBOutlet var termsOfServiceLabel: UILabel!
    @IBOutlet var orLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        setupHeaderLabel()
        setupOrLabel()
        setupTermsLabel()
        setupFacebookButton()
        setupGoogleButton()
        setupCreateAccountButton()
    }

    
    
}

