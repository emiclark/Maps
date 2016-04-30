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
    let regionRadius: CLLocationDistance = 300
    
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
        
       
       //initialize with restaurant data in flatiron district
       flatIronRestaurantsData()
       
        // Add/Show pin for turntotech on map
        let turntotechPin = MapPin(title: "TurnToTech",
            cuisine: "",
            summary: "IOS BootCamp",
            image: "logo.png",
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



            var newImgThumb : UIImageView
            newImgThumb = UIImageView(frame:CGRectMake(0, 0, 100, 70))
            newImgThumb.contentMode = .ScaleAspectFit
            

            // Left Accessory
            let leftAccessory = UILabel(frame: CGRectMake(0,0,50,30))
            leftAccessory.text = description
            leftAccessory.font = UIFont(name: "Verdana", size: 10)
            pinView!.leftCalloutAccessoryView = leftAccessory
        }
        return pinView
    }
    
    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    //load initial restaurant data for flatiron district
    func flatIronRestaurantsData() {
        // Add/Show pin for restaurants in Flatiron District
        let gramercyTavern = MapPin(title: "Gramercy Tavern",
            cuisine: "American",
            summary: "Danny Meyer's Flatiron District tavern with a fixed-price-only dining room & a bustling bar area.",
            image: "gramercy.png",
            locationName: "42 E 20th St.",
            coordinate: CLLocationCoordinate2D(latitude: 40.738541, longitude: -73.988504))
        mapView.addAnnotation(gramercyTavern)
        
        let giorgios = MapPin(title: "Giorgio's of Gramercy",
            cuisine: "American",
            summary: "Longtime eatery serving a New American menu along with numerous pasta dishes.",
            image: "gorgios.png",
            locationName: "27 E 21st St.",
            coordinate: CLLocationCoordinate2D(latitude: 40.739716, longitude: -73.988622))
        mapView.addAnnotation(giorgios)
        
        let elevenMadisonPark = MapPin(title: "Eleven Madison Park",
            cuisine: "American",
            summary: "Upscale American tasting menus from chef Daniel Humm served in a high-ceilinged art deco space.",
            image: "eleven.png",
            locationName: "11 Madison Ave.",
            coordinate: CLLocationCoordinate2D(latitude: 40.73748, longitude: -73.981331))
        mapView.addAnnotation(elevenMadisonPark)
        
        let tacombi = MapPin(title: "Tacombi Flatiron",
            cuisine: "Mexican",
            summary: "Hopping market-feeling eatery comprising a taqueria, juice stand & Veracruz-style coffee bar.",
            image: "tacombi.png",
            locationName: "30 W 24th St.",
            coordinate: CLLocationCoordinate2D(latitude: 40.7425626, longitude: -73.9909777))
        mapView.addAnnotation(tacombi)
        
        let ILILI = MapPin(title: "ILILI",
            cuisine: "Mediterranean",
            summary: "Creative Lebanese small plates ideal for sharing in a trendy space that also serves cocktails.",
            image: "gramercy.png",
            locationName: "236 5th Ave.",
            coordinate: CLLocationCoordinate2D(latitude: 40.748379, longitude: -73.996712))
        mapView.addAnnotation(ILILI)
        
    }


}


