//
//  MealDetectViewModel.swift
//  SmartFitness
//
//  Created by Владимир Никитин on 19.10.2022.
//

import Foundation
import AVKit
class MealDetectViewModel{
        
    func getPreviewLayer()->AVCaptureVideoPreviewLayer?{
        let captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {return nil}
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return nil}
        captureSession.addInput(input)
        captureSession.startRunning()
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        return previewLayer
    }
    
}
