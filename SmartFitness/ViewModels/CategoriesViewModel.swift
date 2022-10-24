//
//  CategoriesViewModel.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 19.10.2022.
//

import Foundation
class CategoriesViewModel{
    var categories = Dynamic([WorkoutPlan(image: nil, name: nil, exerciseCount: nil)])
    func getCategories(){
        categories.value = WorkoutPlan.workouts
    }
}
