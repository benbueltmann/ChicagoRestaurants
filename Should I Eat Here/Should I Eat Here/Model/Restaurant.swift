//
//  Restaurant.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/17/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import Foundation
import CoreLocation.CLLocation

class Restaurant: Decodable, CustomStringConvertible {
    let address: String
    let akaName: String?
    let city: String?
    let state: String?
    let dbaName: String
    let inspectionDate: String
    let latitude: String?
    let longitude: String?
    let results: String
    let risk: String?
    let facilityType: String?
    let violations: String?
    let zip: String?
    
    var description: String {
        return dbaName
    }
    
    var dateDescription: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"

        guard let date = dateFormatter.date(from: inspectionDate) else {
            return inspectionDate
        }
        
        dateFormatter.dateFormat = "MM/dd/yyyy"

        return dateFormatter.string(from: date)
    }
    
    var location: CLLocationCoordinate2D? {
        guard let latitude = latitude, let longitude = longitude else { return nil }
        guard let lat = Double(latitude), let lon = Double(longitude) else { return nil }
        
        return CLLocationCoordinate2D(latitude: Double(lat), longitude: Double(lon))
    }
    
    var individualViolations: [String] {
        guard let violations = violations else { return [] }
        let split = violations.split(separator: "|")
        return split.map(String.init)
    }
}
