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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = restaurant.dbaName.localizedCapitalized

    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 6
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

         Configure the cell...

        return cell
    }
    */
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ViolationsTableViewController
        destinationViewController.restaurant = restaurant
    }
}
