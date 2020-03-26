//
//  ViewController.swift
//  Youtube Video Player
//
//  Created by Abdo on 3/25/20.
//  Copyright © 2020 abdo ramzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //---------------------------------------------------------------
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.performSegue(withIdentifier: "Start", sender: self)
        }
        
    }


}

