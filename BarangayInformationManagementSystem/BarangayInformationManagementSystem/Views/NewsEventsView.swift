//
//  NewsEventsView.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation

import FoldingCell
import UIKit
import JASON
import GoogleMobileAds
class News: UITableViewController{
       var recipes:[Events] = []
    enum Const {
        static let closeCellHeight: CGFloat = 120
        static let openCellHeight: CGFloat = 359
        static let rowsCount = 10
    }
    
    var cellHeights: [CGFloat] = []

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupUI()
    }

    // MARK: Helpers
    private func setup() {
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        tableView.estimatedRowHeight = Const.closeCellHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        if #available(iOS 10.0, *) {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    // MARK: Actions
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tableView.refreshControl?.endRefreshing()
            }
            self?.tableView.reloadData()
        })
    }
    

}

// MARK: - TableView

extension News {
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as StackView = cell else {
            return
        }
        
        cell.backgroundColor = .clear
        
    
        //cell.number = indexPath.row
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! StackView
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
     //   cell.durationsForExpandedState = durations
     //   cell.durationsForCollapsedState = durations
       // let contentView = cell.selectedBackgroundView as! StackView
      cell.configurateTheCell(recipes[indexPath.row])


        
       
    
        return cell
    }
    
    override func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"detailedViewController") as! DetailViewController
        vc.recipe = recipes[indexPath.item]
        self.present(vc, animated: true)
        
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
extension News {
    
    func getEvent(){
        
      
        
        var events: [Events] = []
        var count = 0
        var origCount = 0
        let headers = [
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive",
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
        
        getEvent()
        
    }
    
}
