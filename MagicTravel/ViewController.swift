//
//  ViewController.swift
//  MagicTravel
//
//  Created by Goncalves Higino on 07/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countriesTableView: UITableView!
    
    var countries = ["Angola","Germany", "France", "China", "Brazil", "Australia", "India", "Canada", "USA", "Mexico","Ghana"]
    
    struct Constants {
        static let celldentifier = "MagicCountryCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.celldentifier)
    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.celldentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        cellContentConfiguration.text = countries[indexPath.row]
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
    
}

