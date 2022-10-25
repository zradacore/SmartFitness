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
    @IBOutlet weak var mealCollectionView: UICollectionView!
    @IBOutlet weak var waterProgress: UIProgressView!
    @IBOutlet weak var waterRecLabel: UILabel!
    let story = UIStoryboard(name: "Main", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
        setupDelegates()
    }
    

    private func setupUI(){
        navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont(name: "Gill Sans Bold", size: 35) as Any, .foregroundColor: UIColor.white]
    }
    
    private func setupDelegates(){
        mealCollectionView.delegate = self
        mealCollectionView.dataSource = self
        mealCollectionView.reloadData()
    }
    
    @IBAction func addMealTapped(_ sender: Any) {
        let vc = story.instantiateViewController(withIdentifier: "AddMealViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func scanProductsPTapped(_ sender: Any) {
        let vc = MealDetectorViewController.createObject()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
extension MealPlannerViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealCollectionViewCell", for: indexPath) as! MealCollectionViewCell
        cell.foodImageView.image = UIImage(named: "test")
        cell.clLabel.text = "500 кл"
        cell.foodName.text = "Оладьи"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader{
            sectionHeader.sectionHeaderlabel.text = "Завтрак".uppercased()
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 65)
       }
    
}
