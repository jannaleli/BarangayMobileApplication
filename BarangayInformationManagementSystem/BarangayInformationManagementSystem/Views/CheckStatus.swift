//
//  RecipesTableViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal Arslan on 28/02/16.
//  Copyright © 2016 Bilal ARSLAN. All rights reserved.
//

import UIKit
import JASON

class StatusViewController: UITableViewController {
    var count = 0
    var origCount = 0
    var recipes: [Recipe] = []
    let identifier: String = "tableCellStatus"
    
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(StatusViewController.submitButton))
        closeButton.title = "Close"
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.title = "Status Check"
        getStatus()
    }
    @objc func submitButton() {
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail",
            let indexPath = tableView?.indexPathForSelectedRow,
            let destinationViewController: DetailViewController = segue.destination as? DetailViewController {
           // destinationViewController.recipe = recipes[indexPath.row]
        }
    }
    func getPermit() {
        
        dispatchGroup.enter()
        let headers = [
        
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive"
        ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/document/?username=jannaleli")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                let json = JSON(data)
                self.origCount = json.array!.count

                for each in json {
                    print(each["user_id"].string!)
                    print(each["status"].string!)
                    let each = Recipe(name: each["user_id"].string!, date: each["status"].string!, prepTime: "Clearance")
                    self.recipes.append(each)
         
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getDocuments() {
     
        
        let headers = [
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive"
    
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/permit/?username=jannaleli")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                let json = JSON(data)
                self.origCount = json.array!.count
                
                for each in json {
                    print(each["user_id"].string!)
                    print(each["status"].string!)
                    let each = Recipe(name:  each["user_id"].string!, date: each["status"].string!, prepTime: "Permit")
                    self.recipes.append(each)
                    
                }
                self.dispatchGroup.leave()
            }
        })
        
        dataTask.resume()
    }
    
    func getStatus() {
       getPermit()
        getDocuments()
        dispatchGroup.notify(queue: .main, execute: {
            self.tableView.reloadData()
        })
    }
    
}

extension StatusViewController {
    
    func setupUI() {

        tableView.reloadData()
    }
    
}

// MARK: - UITableView DataSource

extension StatusViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell_Status {
            cell.configurateTheCell(recipes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - UITableView Delegate

extension StatusViewController {
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
}
