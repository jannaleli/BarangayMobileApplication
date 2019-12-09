//
//  Events.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 14/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation

struct Events {
    let event_title: String
    let thumbnails: Data
    let event_desc: String
    let event_date: String
}

extension Events {
    static func createEvents(completionBlock: @escaping CompletionBlock)  {
       
        getEvents(completionBlock: {
            
            
            data, error in
            
            
            let data = data as! [Events]
            completionBlock(data as AnyObject,nil)
        })
    }
    
    
    
    static func getEvents(completionBlock: @escaping CompletionBlock) {
        var count = 0
        var origCount = 0
        var events: [Events] = []
//        DefaultAPI.eventGet(completion: {
//            array, error in
//
//            if let array = array {
//                origCount = array.count
//                for each in array {
//                    
//                    //DefaultAPI.attachmentAttachmentIdGet(attachmentId: each.attachmentId!, //completion: {
//                       // attachment, error in
//                        //print(each)
//                        //print(attachment?.attachmentSrc?.components(separatedBy: "/"))
//                        //let attachmentComponents = attachment?.attachmentSrc?.components(separatedBy: "/")
//                        //let fileName = attachmentComponents?.last!//.components(separatedBy: ".").first
//                        ImageDownloader().downloadData(name:  each.attachmentId!, completionBlock: {
//
//                            data, error in
//
//
//                            let data = data as! Data
//
//                            print(each)
//                            events.append(Events(event_title: each.eventTitle!, thumbnails: data, event_desc: each.eventDesc!))
//                            count = count + 1;
//
//                            if count == origCount {
//                                completionBlock(events as AnyObject,nil)
//                            }
//
//                        })
//                    //})
//
//                }
//            }
//
//        })
        
        
   
    }
}
