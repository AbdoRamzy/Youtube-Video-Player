//
//  VideoListVC.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/26/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import UIKit

class VideoListVC: UIViewController {

            var PlaylistId = ""
            var VideoList  = [VideoViewModel]()
            
            @IBOutlet weak var TableVideolist: UITableView!
             
                    
            override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
                 
                TableVideolist.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")

                TableVideolist.dataSource = self
                TableVideolist.delegate   = self
                TableVideolist.rowHeight  = 100
                
                self.fetchData()
            }
            

            
        
        
        
            //------------------------------
            fileprivate func fetchData() {
                
               // Spinner = UIViewController.displaySpinner(onView: self.view)
                
                
                API.getPlaylistVideos(vc: self, playlistId: PlaylistId ) { ( err, videos ) in
                
 
                    if let err = err {
                            print("Failed to fetch courses:", err)
                            return
                    }
                     
                    if let videoData = videos {
                        
                        if videos!.count > 0 {
                            
                            self.VideoList = videoData
                            //self.PlayListsList = playlists.map({return PlaylistViewModel(playlist: $0)}) //?? []
                        }
                    }
                    self.TableVideolist.reloadData()
                     
                }
                
            }//---> End Of fetchData method -------
        
        
    @IBAction func goBackAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
        
}//---------- End Of Class









extension VideoListVC: UITableViewDataSource, UITableViewDelegate {
            
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                VideoList.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                        
                let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
                cell.videoViewModel = VideoList[indexPath.row]
                cell.BtnVideoPlay.tag = indexPath.row
                cell.BtnVideoPlay.addTarget(self, action: #selector(openVideo(sender:)), for: .touchUpInside)
                return cell
            }
    
            @objc func openVideo(sender: UIButton){
                           
                         let storyboard            = UIStoryboard(name: "Main", bundle: nil)
                           let vc                    = storyboard.instantiateViewController(withIdentifier: "VideoPlayerVC") as! VideoPlayerVC
                               vc.modalPresentationStyle = .overFullScreen
                               vc.modalTransitionStyle   = .crossDissolve
                           
                               vc.VideoID  = self.VideoList[sender.tag].videoId
                           
                           //self.present(vc, animated: true, completion: nil)
                           self.show(vc, sender: nil)
            }
    
            
            
 
            
    }




