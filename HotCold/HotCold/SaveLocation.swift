//
//  SaveLocation.swift
//  HotCold
//
//  Created by user131306 on 2/9/18.
//  Copyright © 2018 Maryville App Development. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class SaveLocation {
    let userLocation = MKUserLocation
    
    
    let savedLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    let savedAnnotation = MKPointAnnotation()
    
}
