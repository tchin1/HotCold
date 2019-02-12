//
//  SavedCoordinates.swift
//  HotCold
//
//  Created by user131306 on 2/11/18.
//  Copyright © 2018 Maryville App Development. All rights reserved.
//

import Foundation
import CoreLocation

class SavedCoordinates {
    let coordinates: SavedLocation
    
    init(coordinates: CLLocation ) {
        self.coordinates = coordinates
    }
    
}
