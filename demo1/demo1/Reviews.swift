//
//  Reviews.swift
//  demo1
//
//  Created by BETTY KWOK on 18/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import Foundation
import UIKit

class Reviews {
// MARKE: type of input
    var userName : String
    var userFeedback : String
    var userRating : Int

//MARKE: make a func
    init(name : String, feedback : String,  rating : Int) {
    
        
        self.userName = name
        self.userFeedback = feedback
        self.userRating = rating
    }
    
}

class Utilities {
//MARKE: show the date.
    static var dateFormatter = DateFormatter()
    static func loadReviews(){
        dateFormatter.dateFormat = "yy/mm/dd"

    }
    
}
