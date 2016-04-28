//
//  MapPin.swift
//  Maps
//
//  Created by Aditya Narayan on 4/27/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

import Foundation
import MapKit

class MapPin: NSObject, MKAnnotation {

    var title: String?
    var subtitle: String?
    var locationName: String?
    var coordinate: CLLocationCoordinate2D

    init( title: String, subtitle: String, locationName: String, coordinate: CLLocationCoordinate2D ) {

        self.title = title
        self.subtitle = subtitle
        self.locationName = locationName
        self.coordinate = coordinate

        super.init()
    }
    
//    var subtitle: String {
//            return locationName
//    }
    
}