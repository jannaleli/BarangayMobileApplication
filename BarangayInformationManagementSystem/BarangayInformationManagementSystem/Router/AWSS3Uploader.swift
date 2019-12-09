//
//  AWSS3Uploader.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 7/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import AWSS3
import AWSCore

class ImageUploader {
    func upload(imgSrc: String, imgName: String, completionBlock: @escaping CompletionBlock){
        
        
        let url = URL(fileURLWithPath: imgSrc)
        let remoteName = imgName
        let S3BucketName = "barangay-api"
        let uploadRequest = AWSS3TransferManagerUploadRequest()!
        uploadRequest.body = url
        uploadRequest.key = remoteName
        uploadRequest.bucket = S3BucketName
        uploadRequest.contentType = "image/jpeg"
        uploadRequest.acl = .bucketOwnerFullControl
        
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(uploadRequest).continueWith(block: { (task: AWSTask) -> Any? in
            if let error = task.error {
                print("Upload failed with error: (\(error.localizedDescription))")
            }
             let exception = task.description 
            if task.result != nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent(uploadRequest.bucket!).appendingPathComponent(uploadRequest.key!)
                completionBlock(publicURL as AnyObject?, nil)
                print("Uploaded to:\(publicURL)")
            }
            return nil
        })
    }
}


