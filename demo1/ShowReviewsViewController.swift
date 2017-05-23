//
//  ShowReviewsViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 18/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit

class ShowReviewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//MAKER: BUILD A TABLE VIEW CONTROLLER//
    @IBOutlet weak var tableView: UITableView!
    var _reviews :Array<String> = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
// MAKER: BUILD A ARRAY FOR FORKEY//
        let ret = UserDefaults.standard.array(forKey: "reviews")
        if ret != nil{
            _reviews = ret as! Array<String>
        }
        tableView.reloadData()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
//-----MAKER: build a func for tableView and return at count//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return _reviews.count/3;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell");
        if cell==nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell");
        }
        let name = _reviews[indexPath.row*3];
        let feadback = _reviews[indexPath.row*3+1];
        let rate = _reviews[indexPath.row*3+2];
        cell?.textLabel?.text = "UserName: \(name),   rating: \(rate)";
        cell?.detailTextLabel?.text = "feadback: \(feadback)";
        
        
        return cell!;
    }

}
