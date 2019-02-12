//
//  SavedLocation.swift
//  HotCold
//
//  Created by user131306 on 2/9/18.
//  Copyright © 2018 Maryville App Development. All rights reserved.
//

import Foundation
import MapKit


class SavedLocation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D

    
    init (coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        
    }
    

    
    
}
