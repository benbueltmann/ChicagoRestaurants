//
//  ViewController.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/17/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {
    
    var restaurants = [Restaurant]()
    var filteredRestaurants = [Restaurant]()
 
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Questionable Restaurants"
        
        NetworkManager.getRestaurants { (restaurants) in
            self.restaurants = restaurants
            self.filteredRestaurants = restaurants
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = filteredRestaurants[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCellID", for: indexPath)
        cell.textLabel?.text = restaurant.dbaName.localizedCapitalized
        cell.detailTextLabel?.text = restaurant.address.localizedCapitalized

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! MapViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationViewController.restaurant = restaurants[indexPath.row]
        }
    }
}

// MARK: - UISearchBarDelegate

extension RestaurantsTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredRestaurants = restaurants
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count > 0 else {
            filteredRestaurants = restaurants
            tableView.reloadData()
            return
        }
        
        let query = searchText.lowercased()
        
        filteredRestaurants = restaurants.filter { (restaurant) -> Bool in
            let akaName = restaurant.akaName ?? "thiswillnevermatchipromise"
            return restaurant.dbaName.lowercased().contains(query) || akaName.lowercased().contains(query)
        }
        tableView.reloadData()
    }
}



