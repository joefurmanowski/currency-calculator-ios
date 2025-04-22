//
//  CurrencyListTableViewController.swift
//  CurrencyCalculatorApp
//
//  Created by Joseph T. Furmanowski on 9/24/22.
//

import UIKit

class CurrencyListTableViewController: UITableViewController {

    let myCalculator = Calculator.shared
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCalculator.currencies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath)
        
        let thisCurrency = myCalculator.currencies[indexPath.row]
        
        cell.textLabel?.text = thisCurrency.name + " " + thisCurrency.symbol
        cell.detailTextLabel?.text = String(thisCurrency.conversionRate)
        
        if indexPath.row == myCalculator.getSelectedIndex() {
            selectedIndexPath = indexPath
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myCalculator.setConversionFactor(currencyIndex: indexPath.row)
        if selectedIndexPath != nil {
            let indexPaths: [IndexPath] = [selectedIndexPath!, indexPath]
            self.tableView.reloadRows(at: indexPaths, with: .none)
            selectedIndexPath = indexPath
        }
    }

}
