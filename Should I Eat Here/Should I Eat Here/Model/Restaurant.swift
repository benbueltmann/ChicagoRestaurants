//
//  Restaurant.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/17/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import Foundation

class Restaurant: Decodable {
    let address: String
    let akaName: String
    let city: String
    let state: String
    let dbaName: String
    let inspectionDate: String
    let latitude: String
    let longitude: String
    let results: String
    let risk: String
    let facilityType: String
    let violations: String
    let zip: String
}
