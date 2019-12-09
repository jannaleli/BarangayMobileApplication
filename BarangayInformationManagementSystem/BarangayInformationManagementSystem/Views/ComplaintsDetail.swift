
//
//  RegisterUser.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 11/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import Eureka
import UIKit
import MapKit

open class ComplaintsDetail: FormViewController {
    
    
    var category: String?
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    
    @objc func submitButton(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func tappedDone(){
        let results = form.validate()
        
        if !results.isEmpty {
            self.showErrorAlert()
            return
        }
        
        let complaintId: String =  "\(CGFloat.random(in: 1...1000))"
 
        

        let complaintDesc: String =   form.rowBy(tag: "description")!.value ?? ""
        let latitude: String = "\(self.latitude)"
        let longitude: String = "\(self.longitude)"
        let type: String = form.rowBy(tag: "category")!.value ?? ""
        let userId: String = form.rowBy(tag: "Username")!.value ?? ""
            
            //UserDefaults.standard.string(forKey: "Username") ?? "Anon"

        let createDate: String = BarangayUtil().dateFormatter(date: Date())
        
        

        let headers = [
            "Content-Type": "application/json",
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "Accept-Encoding": "gzip, deflate",
            "Content-Length": "284",
            "Connection": "keep-alive"
        ]
        let parameters = [
            "complaint_id": complaintId,
            "attachment_id": "4",
            "complaint_desc": complaintDesc,
            "latitude": latitude,
            "longitude": longitude,
            "type": type,
            "user_id": userId,
            "status": "NEW",
            "create_date": createDate
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/complaint")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                self.showErrorAlert()
            } else {
                let httpResponse = response as? HTTPURLResponse
                
                if httpResponse?.statusCode == 200 {
                     self.showAlert()
                }else{
                    self.showErrorResponseAlert()
                }
                
               
            }
        })
        
        dataTask.resume()
        
    }
    
    func showAlert() {
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Success!", message:
                "Complaint has been posted!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
 
    }
    
    func showErrorResponseAlert() {
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Error!", message:
                "Server returned error", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    func showErrorAlert() {
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Error!", message:
                "Some fields required", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ComplaintsDetail.tappedDone))
        button.title = "Submit"
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ComplaintsDetail.submitButton))
        closeButton.title = "Close"
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = button
        form +++ Section("Personal Particulars")
//            <<< TextRow(){ row in
//                row.disabled = true
//                row.title = "Complaint Category"
//                row.tag = "category"
//
//            }
            
                        <<< AlertRow<String>() {
                            $0.title = "Category"
                            $0.tag = "category"
                            $0.cancelTitle = "Dismiss"
                            $0.selectorTitle = "Who is there?"
                            $0.options = ["Roads & Footpaths", "Public Facilities", "Pests", "Stray Animals", "Drinking Water", "Drains & Sewers", "Parks & Greenery", "Public Dispute", "Unecessary Noise", "Others"]
                            $0.value = "Stray Animals"
                            }.onChange { row in
                                print(row.value ?? "No Value")
                            }
                            .onPresent{ _, to in
                                to.view.tintColor = .purple
                        }
            <<< TextAreaRow(){
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
                $0.placeholder = "Complaint Description"
                $0.tag = "description"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 300)
                
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.textView.tintColor = .red
                    }
            }
            
            <<< LocationRow(){
                $0.title = "Location"
                $0.tag = "location"
                let location = CLLocation(latitude: 14.776485, longitude: 121.019054)
                longitude = location.coordinate.longitude
                latitude = location.coordinate.latitude
                $0.value = CLLocation(latitude: 14.776485, longitude: 121.019054)
            }
            <<< ImageRow(){
                $0.tag = "uploadImage"
                $0.title = "Photo"
                
            }
   
                    <<< SegmentedRow<String>(){
                        let names = [UserDefaults.standard.string(forKey: "Username") ?? "", "Anonymous"]
                        $0.options = names
                        $0.value = $0.options?.last
                        $0.tag = "Username"
                    }
        

        
    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
}


