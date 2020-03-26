//
//  API service.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/25/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class API: NSObject {
    
    
    
    
 
    class func getChannelPlaylists(vc: UIViewController, channelId: String, completion: @escaping ( Error?, [PlaylistViewModel]? )->Void){

        var Spinner :UIView!
        
         let url =  "https://www.googleapis.com/youtube/v3/playlists?part=snippet&maxResults=50&channelId=\(channelId)&key=AIzaSyCGJ3ZuPeikHNheYs3RloPP8VWQaQXbph8"

         Spinner = UIViewController.displaySpinner(onView: vc.view)
         AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
                    .validate(statusCode: 200..<600)
                    .responseJSON{ response in

                      //print("Server Get getPlaylistVideos Response___________>\(response.value)")
                        switch response.result
                        {
                        case .failure(let error):
                            UIViewController.removeSpinner(spinner: Spinner)
                            completion(error, nil)
                            print("Server Not response___________>\(error)")

                        case .success(let value):
                            UIViewController.removeSpinner(spinner: Spinner)
                         let json = JSON(value)
                          guard let jsonArr = json["items"].array else{completion(nil,nil)
                              return
                          }

                          var PlaylistArr = [PlaylistViewModel]()// to appended and return

                                 for data in jsonArr {

                                       guard let snippetTitle = data["snippet"]["title"].string else{completion(nil,nil)
                                           return
                                       }

                                       guard let thumbnailURL = data["snippet"]["thumbnails"]["default"]["url"].string else{completion(nil,nil)
                                           return
                                       }

                                       guard let plalistId = data["id"].string else{completion(nil,nil)
                                           return
                                       }

                                    PlaylistArr.append(PlaylistViewModel(playlist: Playlist(Id:    plalistId,
                                                                                            Title: snippetTitle,
                                                                                            Image: thumbnailURL)))


                                 }

                                 completion(nil, PlaylistArr)

                        } //End of switch case
                }//End of alamofire response
     }//---> End Of Method getChannelPlaylists
    
    
    
    
    //------------------------------------------------------------------------------------------------------------------------------------
    class func getPlaylistVideos(vc: UIViewController, playlistId: String, completion: @escaping ( Error?, [VideoViewModel]? )->Void){

         var Spinner :UIView!
        let url =  "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=\(playlistId)&key=AIzaSyCGJ3ZuPeikHNheYs3RloPP8VWQaQXbph8"

        Spinner = UIViewController.displaySpinner(onView: vc.view)
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
                   .validate(statusCode: 200..<600)
                   .responseJSON{ response in

                    //print("Server Get getPlaylistVideos Response___________>\(response.value)")
                       switch response.result
                       {
                       case .failure(let error):
                           UIViewController.removeSpinner(spinner: Spinner)
                           completion(error, nil)
                           print("Server Not response___________>\(error)")

                       case .success(let value):
                        UIViewController.removeSpinner(spinner: Spinner)
                        let json = JSON(value)
                         guard let jsonArr = json["items"].array else{completion(nil,nil)
                             return
                         }

                         var VideosList = [VideoViewModel]()// to appended and return

                                for data in jsonArr {

                                      guard let snippet = data["snippet"]["title"].string else{completion(nil,nil)
                                          return
                                      }

                                      guard let thumbnailURL = data["snippet"]["thumbnails"]["default"]["url"].string else{completion(nil,nil)
                                          return
                                      }

                                      guard let videoId = data["snippet"]["resourceId"]["videoId"].string else{completion(nil,nil)
                                          return
                                      }

                                    VideosList.append(VideoViewModel(video: Video(title: snippet, thumbnailsURL: thumbnailURL, videoId: videoId)))
  
                                }

                                completion(nil, VideosList)

                       } //End of switch case
               }//End of alamofire response
    }//---> End Of Method getPlaylistVideos
    
    
}
