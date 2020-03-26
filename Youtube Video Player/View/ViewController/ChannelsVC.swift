//
//  ChannelsVC.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import UIKit

class ChannelsVC: UIViewController {

    
    
    @IBOutlet weak var TableViewChannels: UITableView!
    
    var ChannelList  = [ChannelViewModel]()
         
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ChannelList.append(ChannelViewModel(channel: Channel(id: 0, Name: "AJ+ كبريت",          ChannelURL: "https://www.youtube.com/channel/UC-4KnPMmZzwAzW7SbVATUZQ", ChannelID: "UC-4KnPMmZzwAzW7SbVATUZQ")))
        ChannelList.append(ChannelViewModel(channel: Channel(id: 1, Name: "معكم منى الشاذلي",   ChannelURL: "https://www.youtube.com/channel/UCcucB5aJ0xmv5OEKQwzAUjw", ChannelID: "UCcucB5aJ0xmv5OEKQwzAUjw")))
        ChannelList.append(ChannelViewModel(channel: Channel(id: 2, Name: "El Zatoona - الزتونة", ChannelURL: "https://www.youtube.com/channel/UCPnXSD5IUw3YdhUy5emn_qg", ChannelID: "UCPnXSD5IUw3YdhUy5emn_qg")))
        ChannelList.append(ChannelViewModel(channel: Channel(id: 3, Name: "Tech Quotes",        ChannelURL: "https://www.youtube.com/channel/UCsAPtCbNnz436DaAr9S3jUw", ChannelID: "UCsAPtCbNnz436DaAr9S3jUw")))
        ChannelList.append(ChannelViewModel(channel: Channel(id: 4, Name: "Egychology - ايجيكولوجي",ChannelURL: "https://www.youtube.com/channel/UCk5OZdnlhjc0DsZrnRUlIeQ", ChannelID: "UCk5OZdnlhjc0DsZrnRUlIeQ")))
        ChannelList.append(ChannelViewModel(channel: Channel(id: 5, Name: "قناة المحترف | Almohtarif channel",ChannelURL: "https://www.youtube.com/channel/UCO58fldVogtwlz7c2PTeWrg", ChannelID: "UCO58fldVogtwlz7c2PTeWrg")))
        
        TableViewChannels.register(UINib(nibName: "ChannelCell", bundle: nil), forCellReuseIdentifier: "ChannelCell")

        TableViewChannels.dataSource = self
        TableViewChannels.delegate   = self
        TableViewChannels.rowHeight  = 80
        
    }
    


}//---------- End Of Class


extension ChannelsVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        ChannelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as! ChannelCell
        cell.channelViewModel = ChannelList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Do something now
        let storyboard            = UIStoryboard(name: "Main", bundle: nil)
        let vc                    = storyboard.instantiateViewController(withIdentifier: "PlaylistVC") as! PlaylistVC
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle   = .crossDissolve
        
        vc.ChannelId  = self.ChannelList[indexPath.row].ChannelID
        
        //self.present(vc, animated: true, completion: nil)
        self.show(vc, sender: nil)
        
    }
    

    
}
