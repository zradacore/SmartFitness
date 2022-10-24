//
//  HomeViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 18.10.2022.
//

import UIKit

class HomeViewController: UIViewController, Storyboardable {
    let story = UIStoryboard(name: "Main", bundle: nil)
    @IBOutlet weak var todayCollectionView: UICollectionView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var workoutsCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let planViewModel = PlanViewModel()
    var workoutPlan : [WorkoutPlan]?{
        didSet{
            DispatchQueue.main.async {
                self.todayCollectionView.reloadData()
            }
        }
    }
    var workouts: [WorkoutPlan]?{
        didSet{
            DispatchQueue.main.async {
                self.workoutsCollectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   setupDelegates()
        bindViewModels()
        planViewModel.getTodayPlan(calories: 500)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       setupUI()
    }
 
    
    private func setupUI(){
        navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont(name: "Gill Sans Bold", size: 35) as Any, .foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        segmentController.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        segmentController.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    private func bindViewModels(){
        planViewModel.todayPlan.bind { [weak self] workoutPlan in
            guard let self = self else {return}
            self.workoutPlan = workoutPlan
        }
    }
    
    private func setupDelegates(){
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        workoutsCollectionView.delegate = self
        workoutsCollectionView.dataSource = self
    }
    
    private func configureTodayPlanCell(cell: TodayPlanCollectionViewCell, indexPath: IndexPath){
        guard let workout = workoutPlan?[indexPath.row] else {return}
        cell.workImage.image = UIImage(named: workout.image ?? "")
        cell.nameExLabel.text = workout.name
        cell.exDescrLabel.text = workout.exerciseCount
        cell.contentView.layer.cornerRadius = 16
    }
    @IBAction func seeAllPressed(_ sender: Any) {
        let vc = CategoriesViewController.createObject()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.largeTitleTextAttributes = nil
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case todayCollectionView:
            return workoutPlan?.count ?? 0
        case workoutsCollectionView:
            return workoutPlan?.count ?? 0
        default: return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case todayCollectionView:
            let cell = todayCollectionView.dequeueReusableCell(withReuseIdentifier: TodayPlanCollectionViewCell.identifier, for: indexPath) as! TodayPlanCollectionViewCell
            configureTodayPlanCell(cell: cell, indexPath: indexPath)
            return cell
        case workoutsCollectionView :
            let cell = todayCollectionView.dequeueReusableCell(withReuseIdentifier: TodayPlanCollectionViewCell.identifier, for: indexPath) as! TodayPlanCollectionViewCell
            configureTodayPlanCell(cell: cell, indexPath: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView{
        default :
            let vc = story.instantiateViewController(withIdentifier: "TrainingViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
