//
//  ViewController.swift
//  HotCold
//
//  Created by user131306 on 1/31/18.
//  Copyright © 2018 Maryville App Development. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    var savedLocation: CLLocation!
    var buttonOnOff = 0
    
    @IBOutlet weak var saveCurrentLocation: UIButton!
    @IBOutlet weak var findLastLocation: UIButton!
    @IBOutlet weak var helpView: UIView!
    
    
    @IBAction func saveCurrentLocation(_ sender: UIButton) {
        savedLocation = manager.location
        findLastLocation.isEnabled = true
        findLastLocation.backgroundColor = UIColor(red: 251.0/255.0, green: 50.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        saveCurrentLocation.backgroundColor = UIColor(red: 69.0/255.0, green: 86.0/255.0, blue: 103.0/255.0, alpha: 1.0)
        
        print(savedLocation)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "findLastLocation" {
            let mapVC = segue.destination as! MapViewController
            mapVC.savedLocation = savedLocation
        }
    }
    
    
    @IBAction func findLastLocation(_ sender: UIButton) {
        performSegue(withIdentifier: "findLastLocation", sender: self)
        
    }
    
    @IBAction func Help(_ sender: UIButton) {
        buttonOnOff += 1
        
        if buttonOnOff == 1 {
            helpView.isHidden = false
            }
        else if buttonOnOff == 2 {
            helpView.isHidden = true
            buttonOnOff = 0
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        manager.allowsBackgroundLocationUpdates = true
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        findLastLocation.isEnabled = false
        
        helpView.isHidden = true
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

