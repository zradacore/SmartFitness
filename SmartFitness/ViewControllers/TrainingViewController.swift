//
//  TrainingViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 22.10.2022.
//

import UIKit
import AVFoundation
import Lottie
import AudioToolbox
class TrainingViewController: UIViewController, Storyboardable {
    var counter = 60{
        didSet{
            if counter != 0{
                DispatchQueue.main.async {
                    self.timerLabel.text = "Time left \(self.counter)"
                }
            }else{
                DispatchQueue.main.async {
                    self.timerLabel.isHidden = true
                }
            }
        }
    }
    var timer = Timer()
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var animView: AnimationView!
    let videoCapture = VideoCapture()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var pointsLayer = CAShapeLayer()
    var isThrowDetected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoCapture.predictor.delegate = self
        setupBackButton()
        self.navigationController?.navigationBar.backgroundColor = .clear
        setupVideoPreview()
        setupAnim()
    }
    
    private func setupVideoPreview(){
        
            self.videoCapture.startCaptureSession()
        
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        
        guard let previewLayer = previewLayer else {return}
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.frame
        
        pointsLayer.strokeColor = UIColor.green.cgColor
     
    }
    
    private func setupAnim(){
        animView.animation = Animation.named("plankAnim")
        animView.frame = view.bounds
        animView.backgroundColor = .white
        animView.layer.cornerRadius = 16
        animView.layer.shadowColor = UIColor.black.cgColor
        animView.layer.shadowRadius = 15
        animView.layer.shadowOpacity = 0.3
        animView.contentMode = .scaleAspectFit
        animView.loopMode = .loop
        animView.play()
    }
  @objc func timerAction() {
          counter -= 1
      }
 
}
extension TrainingViewController: PredictorDelegate{
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double) {
        if action == "Throw" && confidence > 0.70{
            //&& isThrowDetected == false
            print("action", action)
            isThrowDetected = true
            print("Throw detected")
            
          
            DispatchQueue.main.async {
                self.animView.stop()
                AudioServicesPlaySystemSound(SystemSoundID(1016))
                self.animView.isHidden = true
                self.timer.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
            }
        }else{
            DispatchQueue.main.async {
                self.isThrowDetected = false
                self.animView.play()
                self.animView.isHidden = false
                print(action)
                
            }
            
        }
    }
    
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        guard let previewLayer = previewLayer else {return}
        
        let convertedPoints = points.map {
            previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
            
        }
        let combinedPath = CGMutablePath()
        
        for point in convertedPoints {
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            combinedPath.addPath(dotPath.cgPath)
        }
        pointsLayer.path = combinedPath
        
        DispatchQueue.main.async {
            self.pointsLayer.didChangeValue(for: \.path)
        }
    }
    
    
}
