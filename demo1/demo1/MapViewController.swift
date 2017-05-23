//
//  MapViewController.swift
//  demo1
//
//  Created by BETTY KWOK on 16/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var Mkmapview: MKMapView!
    @IBOutlet weak var Xmenu: UIButton!
    @IBAction func XmenuClick(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            resetting()
        }else{
            
            sender.isSelected = true
            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                //----------MARK THE MENU BACK
                self.Xmenu.transform = CGAffineTransform(rotationAngle: 0)
                //MARK: for 3 button's setting
                self.acc.alpha = 0.8
                self.acc.transform = CGAffineTransform(scaleX: 1.5, y: 1.5).concatenating(CGAffineTransform(translationX: -80, y: -25))
                self.hotel.alpha = 0.8
                self.hotel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5).concatenating(CGAffineTransform(translationX: 0, y: -50))
                self.NewArrival.alpha = 0.8
                self.NewArrival.transform = CGAffineTransform(scaleX: 1.5, y: 1.5).concatenating(CGAffineTransform(translationX: 80, y: -20))
            }, completion: nil)
        }
    }
    
    @IBOutlet weak var acc: UIButton!
    
    @IBAction func accClick(_ sender: Any) {
        resetting()
    }

   
    
    @IBOutlet weak var hotel: UIButton!
    
    @IBAction func hotelClick(_ sender: Any) {
        addLocation();
        resetting()
    }

    
       //intiallocation
    let intialocation = CLLocationCoordinate2DMake(-37.8483272,145.1159245)
    let searchRadius: CLLocationDistance = 50000
    
    
    
    @IBOutlet weak var NewArrival: UIButton!


    @IBAction func NewArrivalClick(_ sender: Any) {
    resetting()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//MARK: for 3 button's setting
        
        self.acc.alpha = 0
        self.hotel.alpha = 0
        self.NewArrival.alpha = 0
        self.acc.layer.cornerRadius = 10
        self.hotel.layer.cornerRadius = 10
        self.NewArrival.layer.cornerRadius = 10
        
//MARK: make a range
        let MakeRegion = MKCoordinateRegionMakeWithDistance(intialocation, searchRadius, searchRadius)

//MARK: MAKE SHOW FOR DISPLAY
        Mkmapview.setRegion(MakeRegion, animated: true)
        
        
        
//MARK: FOR MENU BUTTON
        UIView.animate(withDuration: 1, delay: 1, options: UIViewAnimationOptions.curveEaseOut, animations: { 
            self.Xmenu.alpha = 1
            self.Xmenu.transform = CGAffineTransform(rotationAngle: 0.25*3.1415927)
        }, completion: nil)
        
        
        Mkmapview.delegate = self;
        
    }

    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func resetting(){
        UIView.animate(withDuration: 5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            //----------MARK THE MENU BACK
            self.Xmenu.alpha = 1
            self.Xmenu.transform = CGAffineTransform(rotationAngle: 0.25*3.1415927)
            //MARK: for 3 button's setting
            
            self.acc.alpha = 0
            self.acc.transform = CGAffineTransform(scaleX: 1, y: 1).concatenating(CGAffineTransform(translationX: 0, y: 0))
            self.hotel.alpha = 0
            self.hotel.transform = CGAffineTransform(scaleX: 1, y: 1).concatenating(CGAffineTransform(translationX: 0, y: 0))
            self.NewArrival.alpha = 0
            self.NewArrival.transform = CGAffineTransform(scaleX: 1, y: 1).concatenating(CGAffineTransform(translationX: 0, y: 0))
            
        }, completion: nil)
    }

// MARK: ADD MORE INFORMATION
    
    func addLocation(){
        let pointAnnotation1 = MKPointAnnotation()
        pointAnnotation1.coordinate = CLLocationCoordinate2D(latitude: -37.8483272, longitude: 145.1159245)
        pointAnnotation1.title = "hotel1"
        
        let pointAnnotation2 = MKPointAnnotation()
        pointAnnotation2.coordinate = CLLocationCoordinate2D(latitude: -37.701455, longitude: 145.342440)
        pointAnnotation2.title = "Yering Gorge Cottages"
        
        let pointAnnotation3 = MKPointAnnotation()
        pointAnnotation3.coordinate = CLLocationCoordinate2D(latitude: -37.816033, longitude: 145.151148)
        pointAnnotation3.title = "Blackburn Hotel"
    
        let pointAnnotation4 = MKPointAnnotation()
        pointAnnotation4.coordinate = CLLocationCoordinate2D(latitude: -37.817915, longitude: 145.136715)
        pointAnnotation4.title = "Whitehorse Apartments Hotel"
        
        let points = [pointAnnotation1, pointAnnotation2, pointAnnotation3, pointAnnotation4]
        Mkmapview.addAnnotations(points);
    }
    
    //MARK: search function
    func searchMap(place:String){
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = place
        // MARK:search location
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center:intialocation,span: span)
        // MARK: run search and return to the array that save the data.
        
    }
}
