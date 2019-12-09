//
//  AWSS3Downloader.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 14/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import AWSS3
import AWSCore
public typealias CompletionBlock = (_ result: AnyObject?, _ error: String?) -> Void
class ImageDownloader {
    func downloadData(name: String, completionBlock: @escaping CompletionBlock) {
        let expression = AWSS3TransferUtilityDownloadExpression()
        expression.progressBlock = {(task, progress) in DispatchQueue.main.async(execute: {
            // Do something e.g. Update a progress bar.
        })
        }
        
        var completionHandler: AWSS3TransferUtilityDownloadCompletionHandlerBlock?
        completionHandler = { (task, URL, data, error) -> Void in
            DispatchQueue.main.async(execute: {
                // Do something e.g. Alert a user for transfer completion.
                // On failed downloads, `error` contains the error object.
                print(data)
                //completion block here
                completionBlock(data as AnyObject?, nil)
            })
        }
        
        let transferUtility = AWSS3TransferUtility.default()
        transferUtility.downloadData(fromBucket: "barangay-api",
                                     key: name,
                                     expression: expression,
                                     completionHandler: completionHandler)
        
        
        

    }
}
