//
//  Extension+String.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 12.10.2022.
//

import Foundation


extension String{
    func localized()-> String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
