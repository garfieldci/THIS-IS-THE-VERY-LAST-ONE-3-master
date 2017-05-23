//
//  TwitterViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 22/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {

    @IBOutlet weak var webViewC: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//MARKER: which website would you go.
        
        let electronicArmoryURL = URL(string: "http://www.twitter.com")
        
        let electronicArmoryURLRequest = URLRequest(url: electronicArmoryURL!)
        
        webViewC.loadRequest(electronicArmoryURLRequest)
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
