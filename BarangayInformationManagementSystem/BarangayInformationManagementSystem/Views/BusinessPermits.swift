
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

open class BusinessPermits: FormViewController {
    
    @objc func tappedDone(){
        let results = form.validate()
        
        if !results.isEmpty {
            self.showErrorAlert()
            return
        }
        
        
        let user_id: String = "\(CGFloat.random(in: 1...1000))"
        let username: String =  UserDefaults.standard.string(forKey: "Username") ?? ""
        let attachment_id = BarangayUtil().dateFormatter(date: Date())
        let sec_no: String = form.rowBy(tag: "sec_no")!.value ?? "null"
        let business_building_no: String = form.rowBy(tag: "business_building_no")!.value ?? "null"
        let business_street: String = form.rowBy(tag: "business_street")!.value ?? "null"
        let business_activity: String = form.rowBy(tag: "business_activity")!.value ?? "null"
        let business_name: String = form.rowBy(tag: "business_name")!.value ?? "null"
        let capitalization: String = form.rowBy(tag: "capitalization")!.value ?? "null"
        let ctc_no: String = String(Double.random(in: 2.71828...3.14159))
        let lessor_barangay: String = form.rowBy(tag: "lessor_barangay")!.value ?? "null"
        let lessor_bldg_no: String = form.rowBy(tag: "lessor_bldg_no")!.value ?? "null"
        let lessor_city: String = form.rowBy(tag: "lessor_city")!.value ?? "null"
        let lessor_emailaddr: String = form.rowBy(tag: "lessor_emailaddr")!.value ?? "null"
        let lessor_name: String = form.rowBy(tag: "lessor_name")!.value ?? "null"
        let lessor_province: String = form.rowBy(tag: "lessor_province")!.value ?? "null"
        let lessor_street: String = form.rowBy(tag: "lessor_street")!.value ?? "null"
        let lessor_subdv: String = form.rowBy(tag: "lessor_subdv")!.value ?? "null"
        let monthly_rental: String = form.rowBy(tag: "monthly_rental")!.value ?? "null"
        let status: String = "NEW"
        let gross_sale: String = form.rowBy(tag: "gross_sale")!.value ?? "null"
        let no_of_unit: String = form.rowBy(tag: "no_of_unit")!.value ?? "null"
        let approval_date: String = "Pending"//BarangayUtil().dateFormatter(date: Date())

        let headers = [
            "Content-Type": "application/json",
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "Accept-Encoding": "gzip, deflate",
            "Content-Length": "834",
            "Connection": "keep-alive",
        ]
        let parameters = [
            "user_id": user_id,
            "username": username,
            "attachment_id": attachment_id,
            "sec_no": sec_no,
            "business_building_no": business_building_no,
            "business_street": business_street,
            "business_activity": business_activity,
            "business_name": business_name,
            "capitalization": capitalization,
            "ctc_no": ctc_no,
            "lessor_barangay": lessor_barangay,
            "lessor_bldg_no": lessor_bldg_no,
            "lessor_city": lessor_city,
            "lessor_emailaddr": lessor_emailaddr,
            "lessor_name": lessor_name,
            "lessor_province": lessor_province,
            "lessor_street": lessor_street,
            "lessor_subdv": lessor_subdv,
            "monthly_rental": monthly_rental,
            "no_units": no_of_unit,
            "status": status,
            "gross_sale": gross_sale,
            "approval_date": approval_date
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/permit")! as URL,
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
                    self.showAlert(applicationID: user_id)
                }else{
                    self.showErrorResponseAlert()
                }
                
            }
        })
        
        dataTask.resume()
        

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
    func showAlert(applicationID: String) {
        
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Success!", message:
                "Successful application. Please head on over to Status page to check for your status. Application ID: \(applicationID)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    @objc func submitButton() {
        self.dismiss(animated: true, completion: nil)
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
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(BusinessPermits.tappedDone))
        button.title = "Submit"
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(BusinessPermits.submitButton))
        closeButton.title = "Close"
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = button
        
        form +++ Section("Business Particulars")
            

/*
            <<< TextRow(){ row in
                row.title = "CTC Number"
                 row.tag = "ctc_no"
        
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnChange
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        
                    }
            }
            
*/
            <<< TextRow(){ row in
                row.title = "SEC/CDA Number"
                row.tag = "sec_no"

                
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                      cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            

             +++ Section("Business Details")
            <<< TextRow(){ row in
                row.title = "Business Name"
                row.tag = "business_name"
                
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            <<< TextRow(){ row in
                row.title = "Business Activity/Line of Business"
                
                row.tag = "business_activity"
                
                
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }

          
            <<< TextRow(){ row in
                row.title = "Street"
                row.tag = "business_street"
                
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                          cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            
            


            <<< TextRow(){ row in
                row.title = "Business Building No"
                   row.tag = "business_building_no"
               
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                          cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            


            
            
            <<< TextRow(){ row in
                row.title = "No. of Units"
                row.tag = "no_of_unit"
             
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                          cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            
            
            <<< SegmentedRow<String>(){
                $0.title = ""
                $0.tag = "status"
                $0.options = ["New", "Renewal"]
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            
            
            

            
            
            <<< TextRow(){ row in
                row.hidden = Condition.function(["status"], { form in
                    
                    if (form.rowBy(tag: "status") as? SegmentedRow)?.value == "New" {
                        return false
                    }
                        return true
                    
                    
     
                })
                row.title = "Capitalization (New Business)"
                row.tag = "capitalization"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            

            <<< TextRow(){ row in
                row.hidden = Condition.function(["status"], { form in
                    if (form.rowBy(tag: "status") as? SegmentedRow)?.value == "New" {
                        return true
                    }
                    return false
                    
                })
                row.tag = "gross_sale"
                row.title = "Gross Sales (Renewal)"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
           // <<< SwitchRow("rentedBusiness"){
           //     $0.title = "Is the business rented?"
           // }

            +++ Section("Lessor Details (if Rented)")
   
            
            <<< TextRow(){ row in
            //    row.hidden = Condition.function(["rentedBusiness"], { form in
            //        return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
             //   })
                row.title = "Name"
                  row.tag = "lessor_name"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            <<< TextRow(){ row in
              //  row.hidden = Condition.function(["rentedBusiness"], { form in
             //       return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
              //  })
                row.title = "Email Address"
                  row.tag = "lessor_emailaddr"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            <<< TextRow(){ row in
              //  row.hidden = Condition.function(["rentedBusiness"], { form in
               //     return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
              //  })
                row.title = "Building Number"
                 row.tag = "lessor_bldg_no"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            <<< TextRow(){ row in
           //     row.hidden = Condition.function(["rentedBusiness"], { form in
         //           return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
         //       })
                row.title = "Street"
                row.tag = "lessor_street"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            <<< TextRow(){ row in
             //   row.hidden = Condition.function(["rentedBusiness"], { form in
             //       return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
             //   })
                row.title = "Barangay"
                row.tag = "lessor_barangay"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            <<< TextRow(){ row in
               // row.hidden = Condition.function(["rentedBusiness"], { form in
              //      return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
               // })
                row.title = "City"
                row.tag = "lessor_city"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            <<< TextRow(){ row in
          //      row.hidden = Condition.function(["rentedBusiness"], { form in
          //          return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
          //      })
                row.title = "Province"
                row.tag = "lessor_province"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }

            <<< TextRow(){ row in
              //  row.hidden = Condition.function(["rentedBusiness"], { form in
             //       return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
             //   })
                row.title = "Subdivision"
                 row.tag = "lessor_subdv"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
            }
            

            <<< TextRow(){ row in
            //    row.hidden = Condition.function(["rentedBusiness"], { form in
              //      return !((form.rowBy(tag: "rentedBusiness") as? SwitchRow)?.value ?? false)
             //   })
                row.title = "Montly Rental"
                row.tag = "monthly_rental"
                row.add(rule: RuleRequired())
                row.validationOptions = .validatesOnDemand
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.backgroundColor = UIColor(red:0.95, green:0.64, blue:0.64, alpha:1.0)
                    }
        }



        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blue }
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orange  }
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orange }
        DateRow.defaultRowInitializer = { row in row.minimumDate = Date() }
        
       
    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    

}


