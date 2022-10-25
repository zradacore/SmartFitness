//
//  AddMealViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 24.10.2022.
//

import UIKit

class AddMealViewController: UIViewController, Storyboardable {

    @IBOutlet weak var nameMealTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    
    }
    

    private func setupUI(){
        nameMealTextField.layer.cornerRadius = 20
        nameMealTextField.layer.borderWidth = 1
        nameMealTextField.layer.borderColor = UIColor(hexString: "B8EF45").cgColor
    }

}
