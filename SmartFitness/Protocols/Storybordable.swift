//
//  Storybordable.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 12.10.2022.
//

import UIKit

protocol Storyboardable{
    static func createObject() -> Self
}
extension Storyboardable where Self : UIViewController{
    static func createObject() -> Self{
        let id = String(describing: self)
        let stroryboard = UIStoryboard(name: "Main", bundle: nil)
        return stroryboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
