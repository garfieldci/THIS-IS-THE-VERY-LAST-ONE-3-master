//
//  EnterReviewsViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 18/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit

class EnterReviewsViewController: UIViewController {
    
// MAKER: BUILDING FROUR BUTTON FOR OUTLET//
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userFeedback: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var rateLabel: UILabel!
    var rating = 0
    var _reviews :Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// MAKER: SETTING DATA OF BUTTON//
        saveBtn.layer.borderWidth = 1
        saveBtn.layer.borderColor = UIColor.blue.cgColor
        saveBtn.layer.cornerRadius = 5
        saveBtn.layer.masksToBounds = true
        let ret = UserDefaults.standard.array(forKey: "reviews")
        if ret != nil{
            _reviews = ret as! Array<String>
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// MAKER: A BUTTON ACTTION//
    @IBAction func saveClickAction(_ sender: UIButton) {
        let name = self.userName.text; // MAKE A NAME FOR USERNAME //
        let feedback = userFeedback.text; //USER'S COMMENTS SHOW THE TEXT PAGE//
// FOR LOGIC, ALL THE SOME LOGIC
        if name=="" {
            let alert = UIAlertController.init(title: "Error", message: "UserName can not be empty", preferredStyle: .alert) // BUILD A NAME IS ALERCONTROLLER.INIT FUNC
            let cancel = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
        else if feedback==""
        {
            let alert = UIAlertController.init(title: "Error", message: "Feedback can not be empty", preferredStyle: .alert)
            let cancel = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if rating==0
        {
            let alert = UIAlertController.init(title: "Error", message: "Please make your rating", preferredStyle: .alert)
            let cancel = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController.init(title: "Success", message: "Review successfully", preferredStyle: .alert)
            let cancel = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            
            _ = Reviews(name: name!,feedback: feedback!,rating: rating)
            
            _reviews.append(name!)
            _reviews.append(feedback!)
            _reviews.append("\(rating)")
            
            UserDefaults.standard.set(_reviews, forKey: "reviews")
        }
    }
// BUILDING A RATING ACTION BUTTON
    @IBAction func ratingClickAction(_ sender: UIButton) {
        rateLabel.text = "\(sender.tag)/5"
        rating = sender.tag
    }

}
