//
//  MapViewController.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/17/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!

    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = restaurant.dbaName.localizedCapitalized
//        mapView.addAnnotation(restaurant)
    }
    
    // MARK: - Mapview data source
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationViewID")
        return annotationView
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! RestaurantDetailsTableViewController
            destinationViewController.restaurant = restaurant
    }
}
