//
//  ViolationsTableViewController.swift
//  Should I Eat Here
//
//  Created by Ben Bueltmann on 10/18/18.
//  Copyright © 2018 Arrested Development. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {

    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(restaurant.dbaName.localizedCapitalized) Violations"
        tableView.tableFooterView = UIView()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let restaurant = restaurant else {
            return 0
        }
        return restaurant.individualViolations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViolationCellID", for: indexPath)
        cell.textLabel?.text = restaurant.individualViolations[indexPath.row].localizedCapitalized
        return cell
    }
 

}
