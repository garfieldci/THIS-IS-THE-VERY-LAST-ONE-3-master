//
//  FacebookViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 17/5/21.
//  Copyright © 2017年 JUNCHENG WANG. All rights reserved.
//

import UIKit

class FacebookViewController: UIViewController {

    @IBOutlet weak var webViewA: UIWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//MARKER: which website would you go.
        let electronicArmoryURL = URL(string: "http://www.facebook.com")
        
        let electronicArmoryURLRequest = URLRequest(url: electronicArmoryURL!)
        
        webViewA.loadRequest(electronicArmoryURLRequest)
        
        
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
