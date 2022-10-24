//
//  SignUpViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 13.10.2022.
//

import UIKit

class SignUpViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var repeatPassTextField: UITextField!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      setupUI()
  
    }
    

    private func setupUI(){
        signInLabel.text = "Already have an account? Sign In".localized()
        signUpLabel.text = "Sign Up".localized()
        mailTextField.placeholder = "Email".localized()
        fullNameTextField.placeholder = "Full Name".localized()
        paswordTextField.placeholder = "Password".localized()
        repeatPassTextField.placeholder = "Repeat password".localized()
        signUpButton.setTitle("Sign Up".localized(), for: .normal)
        signUpButton.layer.cornerRadius = 7
        signUpButton.addTarget(self, action: #selector(signUpTapped(_:)), for: .touchUpInside)
    }
    @objc func signUpTapped(_ : UIButton){
        let vc = GenderViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
