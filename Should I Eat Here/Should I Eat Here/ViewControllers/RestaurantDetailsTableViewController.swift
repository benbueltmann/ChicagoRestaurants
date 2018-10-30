//
//  RestaurantDetailsTableViewController.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/18/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import UIKit

class RestaurantDetailsTableViewController: UITableViewController {
    
    var restaurant: Restaurant!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var facilityTypeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var riskLabel: UILabel!
    @IBOutlet weak var violationsLabel: UILabel!
    @IBOutlet weak var violationsTableViewCell: UITableViewCell!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = restaurant.dbaName.localizedCapitalized
        addressLabel.text = restaurant.address.localizedCapitalized
        cityLabel.text = restaurant.city?.localizedCapitalized ?? ""
        stateLabel.text = restaurant.state?.localizedCapitalized ?? ""
        facilityTypeLabel.text = restaurant.facilityType?.localizedCapitalized ?? ""
        dateLabel.text = restaurant.dateDescription
        resultsLabel.text = restaurant.results
        riskLabel.text = restaurant.risk?.localizedCapitalized ?? ""
        violationsLabel.text = restaurant.individualViolations.count.description
        if restaurant.individualViolations.count < 1 {
            violationsTableViewCell.isUserInteractionEnabled = false
            violationsTableViewCell.accessoryType = .none
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ViolationsTableViewController
        destinationViewController.restaurant = restaurant
    }
}
