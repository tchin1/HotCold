//
//  MapViewController.swift
//  HotCold
//
//  Created by user131306 on 2/3/18.
//  Copyright © 2018 Maryville App Development. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    var savedLocation: CLLocation!
    var distanceBetween: CLLocationDistance!
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.0001, 0.0001)
        let currentLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(currentLocation, span)
        mapView.setRegion(region, animated: true)
        
        //mapView.userTrackingMode = .follow
        
        
        self.mapView.showsUserLocation = true
        
        //As distance gets smaller, dot changes color (red) - need to fix
        let distance: CLLocationDistance = location.distance(from: savedLocation)
        print(distance)

        distanceBetween = distance
        distanceColor()
//        warmer()
//        colder()
        
    }
    
    
    //color
    func distanceColor(){
        if distanceBetween <= 5.0 {
            mapView.tintColor = UIColor(red: 251.0/255.0, green: 50.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        }
        else if distanceBetween <= 10.0 {
            mapView.tintColor = UIColor(red: 211.0/255.0, green: 47.0/255.0, blue: 42.0/255.0, alpha: 1.0)
        }
        else if distanceBetween <= 15.0 {
            mapView.tintColor = UIColor(red: 187.0/255.0, green: 41.0/255.0, blue: 57.0/255.0, alpha: 1.0)
        }
        else if distanceBetween <= 20.0 {
            mapView.tintColor = UIColor(red: 164.0/255.0, green: 35.0/255.0, blue: 78.0/255.0, alpha: 1.0)
           
        }
        else if distanceBetween <= 35.0 {
            mapView.tintColor = UIColor(red: 140.0/255.0, green: 31.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        }
        else if distanceBetween <= 50.0 {
            mapView.tintColor = UIColor(red: 93.0/255.0, green: 26.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        }
        else if distanceBetween <= 70.0 {
            mapView.tintColor = UIColor(red: 48.0/255.0, green: 28.0/255.0, blue: 196.0/255.0, alpha: 1.0)
        }
        else if distanceBetween <= 100.0 {
            mapView.tintColor = UIColor(red: 53.0/255.0, green: 120.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        }
        else {
            mapView.tintColor = UIColor(red: 5.0/255.0, green: 22.0/255.0, blue: 172.0/255.0, alpha: 1.0)
            }
        }
    
    
    func warmer() {
        var x = Double(distanceBetween)
        x += 5.0
        mapView.tintColor = UIColor(red: 251.0/255.0, green: 50.0/255.0, blue: 67.0/255.0, alpha: 1.0)
    }

    func colder() {
        var x = Double(distanceBetween)
        x -= 5.0
        mapView.tintColor = UIColor(red: 53.0/255.0, green: 120.0/255.0, blue: 246.0/255.0, alpha: 1.0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    
        //let savedLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.7807992, -122.4281929)
        let savedAnnotation = MKPointAnnotation()
        savedAnnotation.coordinate = savedLocation.coordinate
        mapView.addAnnotation(savedAnnotation)

        
        //Current User dot color
        mapView.tintColor = UIColor(red: 51.0/255.0, green: 251.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        
        
        }

    @IBAction func clearLocation(_ sender: Any) {
        let savedAnnotation = MKPointAnnotation()
        mapView.removeAnnotation(savedAnnotation)
        manager.stopUpdatingLocation()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
