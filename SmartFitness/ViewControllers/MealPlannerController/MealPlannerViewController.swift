//
//  MealPlannerViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 19.10.2022.
//

import UIKit

class MealPlannerViewController: UIViewController, Storyboardable {

    @IBOutlet weak var recommendCaloriesLabel: UILabel!
    @IBOutlet weak var mealProgress: UIProgressView!
    @IBOutlet weak var waterProgress: UIProgressView!
    @IBOutlet weak var waterRecLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
    }
    

    private func setupUI(){
        navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont(name: "Gill Sans Bold", size: 35) as Any, .foregroundColor: UIColor.white]
    }
    
    @IBAction func addMealTapped(_ sender: Any) {
    }
    
    @IBAction func scanProductsPTapped(_ sender: Any) {
        let vc = MealDetectorViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
