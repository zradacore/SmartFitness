//
//  SignInViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 13.10.2022.
//

import UIKit

class SignInViewController: UIViewController, Storyboardable {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabelTap()
        setupUI()
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "TabBarController")
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let vc = SignUpViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
    func setupLabelTap() {
            
            let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
            self.signUpLabel.isUserInteractionEnabled = true
            self.signUpLabel.addGestureRecognizer(labelTap)
            
        }

    private func setupUI(){
        signUpLabel.text = "Don't have an account? Sign Up".localized()
        signInLabel.text = "Sign In".localized()
        mailTextField.placeholder = "Email".localized()
        passTextField.placeholder = "Password".localized()
        signInButton.setTitle("Continue".localized(), for: .normal)
        signInButton.layer.cornerRadius = 7
        
    }

}
