//
//  ViewController.swift
//  Maps
//
//  Created by Aditya Narayan on 4/27/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation 

class ViewController: UIViewController {
    let initialLocation = CLLocation(latitude: 40.741434, longitude: -73.990039)
    let regionRadius: CLLocationDistance = 125
    
    let locationManager: CLLocationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    @IBOutlet weak var selectedMapType: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    

    
    //MARK: View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (authorizationStatus == .Denied) {
            print("Denied")
            locationManager.requestWhenInUseAuthorization()
        }
        
        // show pin for turntotech on map
        let turntotechPin = MapPin(title: "TurnToTech",
            subtitle: "IOS BootCamp",
            locationName: "184 5th Ave., NY, NY 10010",
            coordinate: CLLocationCoordinate2D(latitude: 40.741434, longitude: -73.990039))
        
        mapView.addAnnotation(turntotechPin)        
        centerMapOnLocation(initialLocation)
    }
    
    override func viewWillAppear(animated: Bool) {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    //MARK: Utility Functions
    func    centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
    }


    @IBAction func mapDetail(sender: UISegmentedControl!) {
        if (selectedMapType.selectedSegmentIndex == 0){
            //Standard view
            mapView.mapType = MKMapType.Standard
        }else if (selectedMapType.selectedSegmentIndex == 1){
            //Hybrid view
            mapView.mapType = MKMapType.Hybrid
        }else if (selectedMapType.selectedSegmentIndex == 2){
            //Satellite view
            mapView.mapType = MKMapType.Satellite
        }
        
    }
    
    //MARK: Delegate Function
    // Delegate method called each time an annotation appears in the visible window
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let reuseId = "pin"
        

        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true

            pinView?.image = UIImage(named: "flower.jpg")
            let imageview = UIImageView(frame: CGRectMake(0, 0, 45, 45))
            imageview.image = UIImage(named: "logo.png")

//            // Add image to left callout
//            var mugIconView = UIImageView (image: UIImage(named: "apple.png"))
//            pinView!.leftCalloutAccessoryView = mugIconView
//            
//            // Add image to right callout
//            var myRrightCalloutAccessoryView = UIButton(type: .DetailDisclosure)as UIButton
//            pinView!.rightCalloutAccessoryView = myRightCalloutAccessoryView
            
        } else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

