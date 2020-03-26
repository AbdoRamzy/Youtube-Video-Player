//
//  ChannelViewModel.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import Foundation
 


struct ChannelViewModel {

     
    var id:         Int
    var Name:       String
    var ChannelURL: String
    var ChannelID:  String
    
    
    // Dependency Injection (DI)
    init(channel: Channel) {
           
           self.id          = channel.id
           self.Name        = channel.Name
           self.ChannelURL  = channel.ChannelURL
           self.ChannelID     = channel.ChannelID
    }
    
    
}
