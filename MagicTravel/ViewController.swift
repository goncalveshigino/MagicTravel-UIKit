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
    
    var continentCountry: [String: String] = [
        "Angola" : "Africa",
        "Germany" : "Europe",
        "France" : "Europe",
        "China" : "Asia",
        "Brazil" : "South America",
        "Australia" : "Australia",
        "India" : "Asia",
        "Canada" : "North America",
        "USA" : "North Americaan",
        "Mexico" : "North America",
        "Ghana" : "Africa"
    ]
    
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
        let countryName = countries[indexPath.row]
        cellContentConfiguration.text = countryName
        cellContentConfiguration.secondaryText = continentCountry[countryName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("user tapped on cell at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Navigation: Pushing view controllers on naviigation stack
       // let detalViewController = UIViewController()
       // detalViewController.view.backgroundColor = .blue
       // detalViewController.modalPresentationStyle = .popover
    //        navigationController?.pushViewController(detalViewController, animated: true)
        
        performSegue(withIdentifier: "showCountryDetail", sender: self)
    }
    
    
    
}
