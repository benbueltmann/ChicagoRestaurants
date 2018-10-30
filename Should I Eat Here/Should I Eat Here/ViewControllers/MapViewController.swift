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
        
        if let annotation = restaurant.annotation {
            mapView.addAnnotation(annotation)
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
    }
    
    // MARK: - Mapview data source
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationViewID")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! RestaurantDetailsTableViewController
            destinationViewController.restaurant = restaurant
    }
}



private extension Restaurant {
    var annotation: MKAnnotation? {
        return RestaurantAnnotation(restaurant: self)
    }
}

private final class RestaurantAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init?(restaurant: Restaurant) {
        guard let location = restaurant.location else { return nil }
        coordinate = location
        title = restaurant.dbaName.localizedCapitalized
        subtitle = restaurant.address.localizedCapitalized
    }
}
