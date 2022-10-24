//
//  CategoriesViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 19.10.2022.
//

import UIKit

class CategoriesViewController: UIViewController, Storyboardable {

    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var catTableView: UITableView!
    let viewModel = CategoriesViewModel()
    var categories : [WorkoutPlan]?{
        didSet{
            DispatchQueue.main.async {
                self.catTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        self.catTableView.delegate = self
        self.catTableView.dataSource = self
        bindViewModel()
        viewModel.getCategories()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupBackButton()
    }
    //backButton
    
    private func bindViewModel(){
        viewModel.categories.bind { [weak self] categ in
            guard let self = self else {return}
            self.categories = categ
        }
    }
    
    private func setupUI(){
        segmentController.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        segmentController.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    private func configureCell(cell : CategoriesTableViewCell, indexPath: IndexPath){
        guard let category = categories?[indexPath.row] else {return}
        cell.exDescrLabel.text = category.exerciseCount
        cell.exImageView.image = UIImage(named: category.image ?? "")
        cell.namelabel.text = category.name
        cell.proImage.isHidden = true
        if indexPath.row == 2{
            cell.proImage.isHidden = false

        }
    }


}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier, for: indexPath) as! CategoriesTableViewCell
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
}
