//
//  RecipesTableViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal Arslan on 28/02/16.
//  Copyright © 2016 Bilal ARSLAN. All rights reserved.
//

import UIKit
import JASON

class NewsViewController: UITableViewController {
    
    var recipes:[Events] = []
    let identifier: String = "tableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
     
    }
    

    
    
    // MARK: Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(tableView?.indexPathForSelectedRow)
        if segue.identifier == "detailsView",
            let indexPath = tableView?.indexPathForSelectedRow,
            let destinationViewController: DetailViewController = segue.destination as? DetailViewController {
            destinationViewController.recipe = recipes[indexPath.row]
        }
    }
    
}

extension NewsViewController {
    
    func getEvent(){
  
            var events: [Events] = []
        var count = 0
        var origCount = 0
        let headers = [
            "User-Agent": "PostmanRuntime/7.15.0",
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/event")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = data
                print(httpResponse)
                let json = JSON(data)
                origCount = json.array!.count
                
                for each in json {
                    
//                     events.append(Events(event_title: each["event_title"].string!, thumbnails: Data(), event_desc: each["event_desc"].string!))
//                    count = count + 1;
//
//                    if count == origCount {
//                            self.recipes = events
//                            self.tableView.reloadData()
//                    }
                    let attachment = each["attachment_id"].string!
                    let attachmentComponents = attachment.components(separatedBy: "/")
                    let fileName = attachmentComponents.last!//.components(separatedBy: ".").first
                    ImageDownloader().downloadData(name: fileName, completionBlock: {

                        data, error in


                        let dataThumbnail = data as! Data

                        print(each)
                        events.append(Events(event_title: each["event_title"].string!, thumbnails: dataThumbnail, event_desc: each["event_desc"].string!, event_date: each["start_date"].string!))
                        count = count + 1;

                        if count == origCount {
                            self.recipes = events
                                     self.tableView.reloadData()
                        }

                    })
                }
            }
        })
        
        dataTask.resume()
    }
    
    func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: nil)
        navigationItem.title = "What's Happening"
//        Events.getEvents(completionBlock: {
//            data, error in
//
//            let dataEvent = data as! [Events]
//
//              self.tableView.reloadData()
//        })
        
       // getEvent()
      
    }
    
}

// MARK: - UITableView DataSource

extension NewsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell {
            cell.configurateTheEventCell(recipes[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - UITableView Delegate

extension NewsViewController {
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
}
