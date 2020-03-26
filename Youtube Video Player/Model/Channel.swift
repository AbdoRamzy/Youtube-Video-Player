//
//  Channel.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import Foundation


//---> Model
struct Channel: Decodable {

    
    var id:         Int
    var Name:       String
    var ChannelURL: String
    var ChannelID:  String
}
