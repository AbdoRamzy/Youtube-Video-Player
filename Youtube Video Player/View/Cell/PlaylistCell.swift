//
//  PlaylistCell.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import UIKit

class PlaylistCell: UITableViewCell {

    var activityIndicator = UIActivityIndicatorView()
    
    var playlistViewModel: PlaylistViewModel! {
        
        didSet {
            
            self.LblPlaylistName.text = playlistViewModel.Title
            
            ImgPlaylistPreview.addSubview(self.activityIndicator)
            activityIndicator.startAnimating()
            
            let url = NSURL(string: playlistViewModel.Image)!
            let task = URLSession.shared.dataTask(with: url as URL) { (responseData, responseUrl, error) -> Void in
                if (responseData != nil && responseUrl != nil && error == nil)
                {
                    if let data = responseData{
                        DispatchQueue.main.async {
                            self.ImgPlaylistPreview.image = UIImage(data: data)
                            self.activityIndicator.stopAnimating()
                        }
                    }
                } else {
                    DispatchQueue.main.async { // Make sure you're on the main thread here
                        self.ImgPlaylistPreview.image = UIImage(named: "video show")
                        self.activityIndicator.stopAnimating()
                    }
                }
                
            }
            task.resume()
            
            
        }
    }
     
    
    
    @IBOutlet weak var LblPlaylistName: UILabel!    
    @IBOutlet weak var ImgPlaylistPreview: UIImageView!
     
    override func awakeFromNib() {
        super.awakeFromNib()
           // Initialization code
            self.activityIndicator = UIActivityIndicatorView(style: .gray)
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
            self.activityIndicator.hidesWhenStopped = true
            //self.activityIndicator.center = BlogImage.center
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
