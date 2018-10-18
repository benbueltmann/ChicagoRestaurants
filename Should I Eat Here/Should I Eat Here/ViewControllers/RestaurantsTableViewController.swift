//
//  ViewController.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/17/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController, UISearchControllerDelegate {
    
    var restaurants = [Restaurant]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Questionable Restaurants"
        NetworkManager.getRestaurants { (restaurants) in
            self.restaurants = restaurants
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurants[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCellID", for: indexPath)
        cell.textLabel?.text = restaurant.dbaName.localizedCapitalized
        cell.detailTextLabel?.text = restaurant.address.localizedCapitalized
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! MapViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationViewController.restaurant = restaurants[indexPath.row]
        }
    }


}

