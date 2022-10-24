//
//  WorkoutPlanModel.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 18.10.2022.
//

import Foundation
struct WorkoutPlan{
    var image : String?
    var name: String?
    var exerciseCount : String?
}
extension WorkoutPlan{
   static let workouts = [
    WorkoutPlan(image: "firstExImage", name: "Learn the Basic of Training", exerciseCount: "06 Workouts  for Beginner"),
    WorkoutPlan(image: "secExImage", name: "Wake Up Call", exerciseCount: "04 Workouts  for Beginner"),
   WorkoutPlan(image: "thirdExImage", name: "Full Body Goal Crusher", exerciseCount: "07 Workouts  for Beginner")]
}
