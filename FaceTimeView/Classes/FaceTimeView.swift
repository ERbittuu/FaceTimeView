//
//  FaceTimeView.swift
//  FaceTimeView
//
//  Created by erbittuu on 06/02/2017.
//  Copyright (c) 2017 erbittuu. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

/// FaceTimeView Sourcetype which is use for define which type of player will be use
public enum LiveSource{
    case video([URL]), gif(URL), frontCamera, backCamera
}

/// FaceTimeView for beautiful background
public class FaceTimeView : UIView {
    
    /// Use for adding blurview
    fileprivate func addBlurViewIn(view: UIView) {
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
        visualEffectView.frame = view.frame
        view.insertSubview(visualEffectView, at: 0)
    }
    
    @objc private func playerItemDidReachEnd(note : Notification) {
        let current = note.object as! AVPlayerItem
        current.seek(to: kCMTimeZero)
        videoPlayer.advanceToNextItem()
        videoPlayer.insert(current, after: nil)
    }
    
    /// Source type video, gif or camera
    fileprivate var liveSource: LiveSource = .frontCamera
    
    /// AVVideo player session
    fileprivate var cameraSession: AVCaptureSession!
    
    /// FaceTimeView bluring effact. Type is `UIBlurEffectStyle`
    fileprivate var blurStyle: UIBlurEffectStyle!
    
    /// FaceTimeView player use for playing video content in view
    fileprivate var videoPlayer: AVQueuePlayer!
    
    /// FaceTimeView player use for playing gif content in view
    fileprivate var gifPlayer: UIWebView!
    
    /// Custom init for creating FaceTimeView using live camera content in background view
    fileprivate init(type: LiveSource, view: UIView, blurStyle: UIBlurEffectStyle){
        
        self.blurStyle = blurStyle
        super.init(frame: view.frame)
        
        switch type {
        case .video(let urls):
            
            var list : [AVPlayerItem] = []
            for url in urls {
                let item = AVPlayerItem(url: url)
                list.append(item)
                NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object:item)
                
            }
            
            videoPlayer = AVQueuePlayer(items: list)
            
            let playerLayer = AVPlayerLayer(player: videoPlayer)
            playerLayer.frame = self.frame
            playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            
            videoPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.advance
            
            self.layer.insertSublayer(playerLayer, below: self.layer)
            
            videoPlayer.volume = 0
            videoPlayer.seek(to: kCMTimeZero)
            videoPlayer.play()
        case .gif(let url):
            
            gifPlayer = UIWebView(frame: self.frame)
            
            self.layer.insertSublayer(gifPlayer.layer, at: 0)
            let htmlCode = "<!DOCTYPE html> <html style=\"height: 100%;\">  <body style=\"margin:0; height: 100%\">  <div style=\"background: url(\(url)) center center / cover no-repeat; height: 100%\" ></div>  </body>"
            gifPlayer.loadHTMLString(htmlCode, baseURL:nil)
            
        case .frontCamera:
            let videoDevices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo)
            for device in videoDevices!{
                let device = device as! AVCaptureDevice
                if device.position == AVCaptureDevicePosition.front {
                    cameraStart(device: device)
                    break
                }
            }
        case .backCamera:
            let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
            cameraStart(device: captureDevice!)
        }
        self.tag = Mytag
    }
    
    fileprivate func cameraStart(device : AVCaptureDevice) {
        cameraSession = AVCaptureSession()
        cameraSession.sessionPreset = AVCaptureSessionPresetHigh
        do{
            let input = try AVCaptureDeviceInput.init(device: device)
            cameraSession.addInput(input)
            let newCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: cameraSession)!
            newCaptureVideoPreviewLayer.frame = self.frame
            self.layer.insertSublayer(newCaptureVideoPreviewLayer, at: 0)
        }catch{
            print("Some issue while getting camera device")
        }
        cameraSession.startRunning()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented. please check example code available at https://github.com/ERbittuu/FaceTimeView")
    }
}

public extension UIViewController {
    func startLiveFor(type : LiveSource, blurStyle : UIBlurEffectStyle = .dark){
        
        for v in self.view.subviews {
            if v.tag == Mytag {
                print("Already another view effact is added.")
                return
            }
        }
        
        let blur = FaceTimeView.init(type: type, view: self.view, blurStyle: blurStyle)
        blur.addBlurViewIn(view: self.view)
        self.view.insertSubview(blur, at: 0)
    }
}

private let Mytag = 123654789
