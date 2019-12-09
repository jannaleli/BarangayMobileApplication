//
//  Login.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 12/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation

import Eureka
open class BarangayClearance: FormViewController {
    
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(BarangayClearance.tappedDone))
        button.title = "Submit"
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(BarangayClearance.submitButton))
        closeButton.title = "Close"
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = button
        form +++ Section("Personal Particulars")
            <<< ActionSheetRow<String>() {
                $0.tag = "reason"
                $0.title = "Reason for Application"
                $0.selectorTitle = "Reason"
                $0.options = ["Employment", "Business Permit"]
                $0.value = "Choose One"
                }
                .onPresent { from, to in
                    to.popoverPresentationController?.permittedArrowDirections = .up
        }
        
            <<< TextRow(){ row in
                row.title = "Government ID (Passport/TIN/SSS/Etc.)"
                row.tag = "governmentId"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.textField.textColor = .red
                    }
        }
}
    
    
    @objc func submitButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func tappedDone(){
        let results = form.validate()
        
        if !results.isEmpty {
            self.showErrorAlert()
            return
        }
        let userId =  "\(CGFloat.random(in: 1...1000))"
        let username = UserDefaults.standard.string(forKey: "Username") ?? "null"
        let expirationDate = "null"
        let governmentID = form.rowBy(tag: "governmentId")!.value ?? "null"
        let attachmentId = "2"
        let reason = form.rowBy(tag: "reason")!.value ?? "null"
        let status = "NEW"

        
        
        let headers = [
            "Content-Type": "application/json",
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "Accept-Encoding": "gzip, deflate",
            "Content-Length": "243",
            "Connection": "keep-alive",
        ]
        let parameters = [
            "user_id": userId,
            "username": username,
            "expiration_date": expirationDate,
            "government_id": governmentID,
            "attachment_id":attachmentId,
            "reason": reason,
            "status": "NEW"
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/document")! as URL,
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
               
                if httpResponse?.statusCode == 200{
                    self.showAlert(applicationID: userId)
                }else{
                        self.showErrorResponseAlert()
                }
         
            }
        })
        
        dataTask.resume()
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
    
    func close(){
          self.dismiss(animated: true, completion: nil)
    }
    func showAlert(applicationID: String) {
        
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Success!", message:
                "Successful application. Please head on over to Status page to check for your status. Application ID: \(applicationID)", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction.init(title: "Yes", style: .default) { (UIAlertAction) -> Void in
                CATransaction.begin()
               // CATransaction.setCompletionBlock(/* YOUR BLOCK GOES HERE */<#(() -> Void)?#>)
                self.navigationController?.popToRootViewController(animated: true)
                CATransaction.commit()
            })
          //  alertController.addAction(UIAlertAction(title: nil, style: .cancel, handler: ({
           //     self.dismiss(animated: true, completion: nil)
          //  }))
            self.present(alertController, animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
            
            })
        
        
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
}
