//
//  VideosViewModel.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import Foundation


 
struct VideoViewModel {

    
    let title:           String
    let thumbnailsURL:   String
    let videoId:         String
    
    
    // Dependency Injection (DI)
    init(video: Video) {
           
           self.title           = video.title
           self.thumbnailsURL   = video.thumbnailsURL
           self.videoId         = video.videoId
    }
    
    
}
