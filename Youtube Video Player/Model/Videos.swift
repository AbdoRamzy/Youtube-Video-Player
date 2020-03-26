//
//  Videos.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/25/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import Foundation


//---> Model
struct Video: Decodable {

    
    let title:           String
    let thumbnailsURL:   String
    let videoId:         String
    
}
