//
//  ViewController.swift
//  TableView
//
//  Created by Zach Evetts on 2/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var info : String = ""

    var cities = [
        CityState("Auburn", "AL"),
        CityState("Atlanta", "GA"),
        CityState("Chicago", "IL"),
        CityState("New York", "NY"),
        CityState("Los Angeles", "CA"),
        CityState("Austin", "TX"),
        CityState("Tucson", "AZ")
    ]
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "toSecondView", sender: self)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = cities[indexPath.row].city
        content.secondaryText = cities[indexPath.row].state
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            print("Deleted " + self.cities[indexPath.row].city)
            self.cities.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "toSecondView", sender: indexPath) //Pass indexPath as sender instead of self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {

            let secondView = segue.destination as! SecondViewController
            let indexPath = sender as! IndexPath
            secondView.info = cities[indexPath.row].city
        }
    }
}
