//
//  PopUpViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 16/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import Foundation
import UIKit

class PopUpViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Close the current Pop-Up View
    @IBAction func closePopUp(_ sender: AnyObject) {
        self.view.removeFromSuperview()
    }
}
