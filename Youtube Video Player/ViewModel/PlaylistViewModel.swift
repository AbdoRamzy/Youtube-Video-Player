//
//  PlaylistViewModel.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import Foundation
 

struct PlaylistViewModel {

 
    var Id:      String
    var Title:   String
    var Image:   String
    
    
    // Dependency Injection (DI)
    init(playlist: Playlist) {
           
           self.Id      = playlist.Id
           self.Title   = playlist.Title
           self.Image   = playlist.Image
    }
    
    
}
