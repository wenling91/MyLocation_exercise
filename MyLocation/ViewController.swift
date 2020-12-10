//
//  ViewController.swift
//  MyLocation
//
//  Created by NDHU_CSIE on 2020/12/10.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet var latLabel: UILabel!
    @IBOutlet var longLabel: UILabel!
    
    @IBAction func getLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestLocation()   //request once
//        locationManager.startUpdatingLocation()   //continuous request
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authState = CLLocationManager.authorizationStatus()
        if authState == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            latLabel.text = "\(location.coordinate.latitude)"
            longLabel.text = "\(location.coordinate.longitude)"
        }
    }

    
}

