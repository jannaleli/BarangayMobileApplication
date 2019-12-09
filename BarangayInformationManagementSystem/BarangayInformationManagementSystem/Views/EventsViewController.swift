//
//  RecipesTableViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal Arslan on 28/02/16.
//  Copyright © 2016 Bilal ARSLAN. All rights reserved.
//

import UIKit
//
//class EventsViewController: UITableViewController {
//    
//    var recipes: [Recipe] = []
//    let identifier: String = "tableCell"
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//    
//    // MARK: Segue Method
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "newsDetail",
//            let indexPath = tableView?.indexPathForSelectedRow,
//            let destinationViewController: DetailViewController = segue.destination as? DetailViewController {
//           // destinationViewController.recipe = recipes[indexPath.row]
//        }
//    }
//    
//
//    
//}
//
//extension EventsViewController {
//    
//    func setupUI() {
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
//        tableView.reloadData()
//    }
//    
//}
//
//// MARK: - UITableView DataSource
//
//extension EventsViewController {
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recipes.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell_Status {
//            cell.configurateTheEventCell(recipes[indexPath.row])
//            return cell
//        }
//        return UITableViewCell()
//    }
//    
//}
//
//// MARK: - UITableView Delegate
//
//extension EventsViewController {
//    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            recipes.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .bottom)
//        }
//    }
//    
//}
