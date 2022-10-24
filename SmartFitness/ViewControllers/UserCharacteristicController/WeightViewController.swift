//
//  WeightViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 13.10.2022.
//

import UIKit

class WeightViewController: UIViewController, Storyboardable {
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        weightLabel.text = "30 KG"
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
    }
    
 
    
    @IBAction func nextTapped(_ sender: Any) {
        let vc = HeightViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension WeightViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        let x = scrollView.contentOffset.x
        if x < 30{
            self.weightLabel.text = "30 KG"
        }else{
            if x >= 30 && x <= 160{
                self.weightLabel.text = "\(Int(x.rounded())) KG"
            }
        }
    }
}
