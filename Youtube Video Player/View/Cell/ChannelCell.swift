//
//  ChannelCell.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    
    var channelViewModel: ChannelViewModel! {
        
        didSet {
            
            self.LblChannelName.text = channelViewModel.Name
        }
        
    }
    
    
    
    @IBOutlet weak var LblChannelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // backView.CardView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
