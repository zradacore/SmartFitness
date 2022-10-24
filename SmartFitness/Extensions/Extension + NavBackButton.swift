//
//  Extension + NavBackButton.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 19.10.2022.
//

import Foundation
import UIKit

extension UIViewController{
    func setupBackButton(){
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goBackTapped))
        navigationItem.setLeftBarButtonItems([backButton], animated: true)
                navigationItem.leftItemsSupplementBackButton = false
    }
    @objc func goBackTapped(){
            self.navigationController?.popViewController(animated: true)
        }
}
