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
    var cuisine: String?
    var summary: String?
    var image: String?
    var locationName: String?
    var coordinate: CLLocationCoordinate2D

    init( title: String, cuisine: String, summary: String, image: String, locationName: String,  coordinate: CLLocationCoordinate2D) {

        self.title = title
        self.cuisine = cuisine
        self.summary = summary
        self.image = image
        self.locationName = locationName
        self.coordinate = coordinate

        super.init()
    }
    
}