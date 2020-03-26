//
//  VideoPlayerVC.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//


import UIKit
import YouTubePlayer

    class VideoPlayerVC: UIViewController, YouTubePlayerDelegate {

        @IBOutlet weak var videoPlayer: YouTubePlayerView!
        
        var Spinner :UIView!
        var VideoID = ""
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.videoPlayer.delegate = self
            Spinner = UIViewController.displaySpinner(onView: self.view)
            if VideoID != "" {
                
                self.videoPlayer.loadVideoID("\(VideoID)")
            }
            
            NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.batteryLevelChanged),
            name: NSNotification.Name("UIScreenCapturedDidChange"),
            object: nil)
            
        }//-------> End Of ViewDidLoad ----------
        
        
        @objc private func batteryLevelChanged(notification: NSNotification){
            //do stuff using the userInfo property of the notification object
            
                let isCaptured = UIScreen.main.isCaptured
                
                if (isCaptured) {
                    self.videoPlayer.isHidden = false;
                    print("\n ---> Captured <---")
                }
                else {
                    self.videoPlayer.isHidden = true;
                    print("\n ---> Not Captured <---")
                }
        }
        
       
        
        func playerReady(_ videoPlayer: YouTubePlayerView){
            
           // print("\n status:\(videoPlayer.ready) | Status: \(videoPlayer.playerState)")
            if videoPlayer.ready {
                UIViewController.removeSpinner(spinner: self.Spinner)
            }
            
        }
        
        func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
               
               print("\n State: \(playerState.rawValue) , \(playerState.hashValue) , \(playerState)")
               
           }
        
        
        


        @IBAction func backViewRecognizerAction(_ sender: Any) {
            
            self.dismiss(animated: true, completion: nil)
        }

    }
