//
//  HeightViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 13.10.2022.
//

import UIKit

class HeightViewController: UIViewController, Storyboardable {
    @IBOutlet weak var heightPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightPicker.delegate = self
        heightPicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        heightPicker.selectRow(50, inComponent: 0, animated: true)
    }
    
    @IBAction func startTapped(_ sender: Any) {
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension HeightViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 140
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let atrString = NSAttributedString(string: "\(row + 100) cm", attributes: [.foregroundColor : UIColor.init(hexString: "B8EF45")])
        
        return atrString
    }
}
