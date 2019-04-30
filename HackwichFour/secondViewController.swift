
//  ViewController.swift
//  HackwichSeven
//
//  Created by CM Student on 4/18/19.
//  Copyright © 2019 Jordan Ballesteros. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class secondViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 21.361888 , longitude: -158.055725)
    let regionRadius: CLLocationDistance = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        centerMapOnLocation(location: initialLocation)
        
        let restaurantOne = Restaurant(title: "Kalapawai", type: "American", coordinate: CLLocationCoordinate2D(latitude: 21.346470, longitude: -158.080098))
        let restaurantTwo = Restaurant(title: "Coco Ichibanya", type: "American", coordinate: CLLocationCoordinate2D(latitude: 21.329647, longitude: -158.078001))
        let restaurantThree = Restaurant(title: "Gyu-Kaku", type: "American", coordinate: CLLocationCoordinate2D(latitude: 21.331106, longitude: -158.094027))
        let restaurantFour = Restaurant(title: "Ton Ton Ramen", type: "American", coordinate: CLLocationCoordinate2D(latitude: 21.378562, longitude: -158.025799))
        let restaurantFive = Restaurant(title: "Ohana Ramen", type: "American", coordinate: CLLocationCoordinate2D(latitude: 21.387904, longitude: -158.033366))
        
        mapView.addAnnotation(restaurantOne)
        mapView.addAnnotation(restaurantTwo)
        mapView.addAnnotation(restaurantThree)
        mapView.addAnnotation(restaurantFour)
        mapView.addAnnotation(restaurantFive)
        
        self.navigationItem.title = "Map"
        self.tabBarItem.image = UIImage(named: "icons8-map_marker")
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius,regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


