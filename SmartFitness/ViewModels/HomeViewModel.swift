//
//  HomeViewModel.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 18.10.2022.
//

import Foundation
import UIKit
class PlanViewModel{
    
    
    
    var todayPlan = Dynamic([WorkoutPlan(image: nil, name: nil, exerciseCount: nil)])
    
    func getTodayPlan(calories : Int){
        todayPlan.value = WorkoutPlan.workouts
    }
   
}
