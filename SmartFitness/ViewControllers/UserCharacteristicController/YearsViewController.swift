//
//  YearsViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 13.10.2022.
//

import UIKit

class YearsViewController: UIViewController, Storyboardable {

    @IBOutlet weak var agePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        agePicker.dataSource = self
        agePicker.delegate = self
        agePicker.selectRow(18, inComponent: 0, animated: true)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let vc = WeightViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension YearsViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        100
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let atrString = NSAttributedString(string: "\(row + 1)", attributes: [.foregroundColor : UIColor.init(hexString: "B8EF45")])
        
        return atrString
    }
    
    
}
