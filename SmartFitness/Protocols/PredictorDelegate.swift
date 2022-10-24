//
//  PredictorDelegate.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 22.10.2022.
//

import Foundation
protocol PredictorDelegate : AnyObject{
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint])
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double)
}
