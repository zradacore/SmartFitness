//
//  MealDetectorViewController.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 19.10.2022.
//

import UIKit
import AVKit

class MealDetectorViewController: UIViewController, Storyboardable {
    
    
    var viewModel = MealDetectViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        startCaptureSession()
    }
    
    private func startCaptureSession(){
        let captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {return}
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return}
        captureSession.addInput(input)
        DispatchQueue.main.async {
            captureSession.startRunning()
        }
     
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        print("2")
        previewLayer.frame = self.view.frame
        print("3")
        
    }
    

    

}
