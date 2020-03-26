//
//  PlaylistVC.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import UIKit

class PlaylistVC: UIViewController {


        var ChannelId = ""
        var PlayListsList  = [PlaylistViewModel]()
        
        @IBOutlet weak var TableViewPlaylists: UITableView!
         
                
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
             
            TableViewPlaylists.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: "PlaylistCell")

            TableViewPlaylists.dataSource = self
            TableViewPlaylists.delegate   = self
            TableViewPlaylists.rowHeight  = 100
            
            self.fetchData()
        }
        

        
    
    
    
        //------------------------------
        fileprivate func fetchData() {
            
            API.getChannelPlaylists(vc: self, channelId: ChannelId) { ( err, playlists ) in
                 
                //UIViewController.removeSpinner(spinner: self.Spinner)
                if let err = err {
                        print("Failed to fetch courses:", err)
                        return
                }
                 
                if playlists != nil {
                    
                    if playlists!.count > 0 {
                        
                        self.PlayListsList = playlists!
                        //self.PlayListsList = playlists.map({return PlaylistViewModel(playlist: $0)}) //?? []
                    }                    
                }
                self.TableViewPlaylists.reloadData()
                 
            }
            
        }//---> End Of fetchData method -------
    
    
    @IBAction func goBackAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}//---------- End Of Class









extension PlaylistVC: UITableViewDataSource, UITableViewDelegate {
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            PlayListsList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath) as! PlaylistCell
            cell.playlistViewModel = PlayListsList[indexPath.row]
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            // Do something now
            let storyboard            = UIStoryboard(name: "Main", bundle: nil)
            let vc                    = storyboard.instantiateViewController(withIdentifier: "VideoListVC") as! VideoListVC
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle   = .crossDissolve
            
                vc.PlaylistId  = self.PlayListsList[indexPath.row].Id
            
            //self.present(vc, animated: true, completion: nil)
            self.show(vc, sender: nil)
            
        }
        
    }
