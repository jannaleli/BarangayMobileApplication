//
//  RecipesTableViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal Arslan on 28/02/16.
//  Copyright © 2016 Bilal ARSLAN. All rights reserved.
//
import Foundation
import UIKit
import JASON

public class StatusViewController: UITableViewController {
    var count = 0
    var origCount = 0
    var recipes: [Recipe] = []
    var statusArray: [Status] = []
    let identifier: String = "tableCellStatus"
    
    let dispatchGroup = DispatchGroup()
    
    override public func viewDidLoad() {
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
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "recipeDetail",
          //  let indexPath = tableView?.indexPathForSelectedRow,
          //  let destinationViewController: DetailViewController = segue.destination as? DetailViewController {
           // destinationViewController.recipe = recipes[indexPath.row]
        //}
    }
    func getPermit() {
        
        dispatchGroup.enter()
        let headers = [
        
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive"
        ]
        let username =  UserDefaults.standard.string(forKey: "Username")!
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/document/\(username)")! as URL,
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
                    let recipeItem = Recipe(name: each["user_id"].string!, date: each["status"].string!, prepTime: "Clearance")
                    let statusItem = Status(type: "Clearance Application", description: each["reason"].string!, date: each["expiration_date"].string!  )
                    self.statusArray.append(statusItem)
                    self.recipes.append(recipeItem)
         
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getDocuments() {
        let username =  UserDefaults.standard.string(forKey: "Username")!
        
        let headers = [
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive"
    
        ]
      //  ?username=
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/permit/\(username)")! as URL,
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
                    let recipeItem = Recipe(name:  each["user_id"].string!, date: each["status"].string!, prepTime: "Permit")
                    let statusItem = Status(type: "Business Permit Application", description: each["business_name"].string!, date: each["approval_date"].string! )
                    self.statusArray.append(statusItem)
                    self.recipes.append(recipeItem)
                    
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
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell_Status {
            cell.configurateTheCell(recipes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let statusItem = statusArray[indexPath.row]
        var alertController:UIAlertController?
        if statusItem.type == "Business Permit Application" {
            alertController = UIAlertController(title: statusItem.type, message: "Business Name: \(statusItem.description) \n Application Date: \(statusItem.date) \n\n Note: Barangay Business Permit is renewed anually. Please watch out for the announcement.", preferredStyle: .alert)
        }else{
            alertController = UIAlertController(title: statusItem.type, message: "Reason for Application: \(statusItem.description) \n Application Date: \(statusItem.date) \n\n Note: Barangay Clearance will expire 1 year from approval date.", preferredStyle: .alert)
        }
        
        //We add buttons to the alert controller by creating UIAlertActions:
        let actionOk = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil) //You can use a block here to handle a press on this button
        
        alertController!.addAction(actionOk)
        
        self.present(alertController!, animated: true, completion: nil)
        
        //        let cell = tableView.cellForRow(at: indexPath) as! StackView
        //
        //        if cell.isAnimating() {
        //            return
        //        }
        //
        //        var duration = 0.0
        //        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        //        if cellIsCollapsed {
        //            cellHeights[indexPath.row] = Const.openCellHeight
        //            cell.unfold(true, animated: true, completion: nil)
        //            duration = 0.5
        //        } else {
        //            cellHeights[indexPath.row] = Const.closeCellHeight
        //            cell.unfold(false, animated: true, completion: nil)
        //            duration = 0.8
        //        }
        //
        //        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
        //            tableView.beginUpdates()
        //            tableView.endUpdates()
        //
        //            // fix https://github.com/Ramotion/folding-cell/issues/169
        //            if cell.frame.maxY > tableView.frame.maxY {
        //                tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        //            }
        //        }, completion: nil)
    }
    
}

// MARK: - UITableView Delegate

extension StatusViewController {
    
    override public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
}
