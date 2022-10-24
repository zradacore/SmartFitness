//
//  GenderViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 13.10.2022.
//

import UIKit

class GenderViewController: UIViewController, Storyboardable {
    
    
    @IBOutlet weak var maleButtom: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var tellLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var nextButon: UIButton!
    @IBOutlet weak var anyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func maleTapped(_ sender: Any) {
        maleButtom.setTitleColor(.black, for: .normal)
        maleButtom.setImage(UIImage(named: "maleChoir"), for: .normal)
        maleButtom.backgroundColor = UIColor.init(hexString: "B8EF45")
        
        femaleButton.setTitleColor(.white, for: .normal)
        femaleButton.setImage(UIImage(named: "femaleChoir"), for: .normal)
        femaleButton.backgroundColor = UIColor.init(hexString: "2C2C2E")
        anyButton.setTitleColor(.white, for: .normal)
        
    }
    @IBAction func femaleTapped(_ sender: Any) {
        femaleButton.setTitleColor(.black, for: .normal)
        femaleButton.setImage(UIImage(named: "femaleBlack"), for: .normal)
        femaleButton.backgroundColor = UIColor.init(hexString: "B8EF45")
        
        maleButtom.setTitleColor(.white, for: .normal)
        maleButtom.setImage(UIImage(named: "maleWhite"), for: .normal)
        maleButtom.backgroundColor = UIColor.init(hexString: "2C2C2E")
        anyButton.setTitleColor(.white, for: .normal)
    }
    @IBAction func anyButtonTapped(_ sender: Any) {
        maleButtom.setTitleColor(.white, for: .normal)
        maleButtom.setImage(UIImage(named: "maleWhite"), for: .normal)
        maleButtom.backgroundColor = UIColor.init(hexString: "2C2C2E")
        femaleButton.setTitleColor(.white, for: .normal)
        femaleButton.setImage(UIImage(named: "femaleChoir"), for: .normal)
        femaleButton.backgroundColor = UIColor.init(hexString: "2C2C2E")
        anyButton.setTitleColor(UIColor.init(hexString: "B8EF45"), for: .normal)
        anyButton.backgroundColor = .clear
    }
    
    private func setupUI(){
        tellLabel.text = "TELL US ABOUT YOURSELF".localized()
        subTitleLabel.text = "TO GIVE YOU A BETTER EXPERIENCE WE NEED TO KNOW YOUR GENDER".localized()
        nextButon.setTitle("Next".localized(), for: .normal)
        maleButtom.layer.cornerRadius = maleButtom.frame.height / 2
        femaleButton.layer.cornerRadius = femaleButton.frame.height / 2
        femaleButton.setTitle("Female".localized(), for: .normal)
        maleButtom.setTitle("Male".localized(), for: .normal)
        maleButtom.contentMode = .center
        maleButtom.imageView?.contentMode = .scaleAspectFill
        anyButton.setTitle("Any ...".localized(), for: .normal)
        anyButton.backgroundColor = .clear
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let vc = YearsViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
