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
import GenericPasswordRow
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient
typealias Emoji = String
let 👦🏼 = "👦🏼", 🍐 = "🍐", 💁🏻 = "💁🏻", 🐗 = "🐗", 🐼 = "🐼", 🐻 = "🐻", 🐖 = "🐖", 🐡 = "🐡"
open class RegisterUser: FormViewController {
    

  let dispatchGroup = DispatchGroup()
    
    override open func viewDidLoad() {
       
            super.viewDidLoad()

        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(RegisterUser.tappedDone))
        button.title = "Submit"
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(RegisterUser.submitButton))
        closeButton.title = "Close"
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = button

            form +++ Section("Personal Particulars")
                
                            <<< EmailRow() {
                                $0.tag = "emailAddr"
                                $0.title = "Email Address"
                                $0.value = "a@b.com"
                                $0.add(rule: RuleRequired())
                                $0.add(rule: RuleEmail())
                                 $0.validationOptions = .validatesOnChange
                                }.cellUpdate { cell, row in
                                    if !row.isValid {
                                        cell.textField.textColor = .red
                                    }
                }
                /*
                <<< TextRow(){ row in
                    row.title = "Username"
                    row.tag = "username"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }*/
                
                <<< GenericPasswordRow() {
                   // $0.title = "Password"
                     $0.tag = "password"
                    $0.value = "password"
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< TextRow(){ row in
                    row.title = "First Name"
                     row.tag = "firstname"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< TextRow(){ row in
                    row.title = "Last Name"
                     row.tag = "lastname"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< PhoneRow(){
                    $0.title = "Phone"
                    $0.tag = "mobilenumber"
                    
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< DateRow(){
                    $0.title = "Birth Date"
                    $0.tag = "date"
                    $0.value = Date(timeIntervalSinceReferenceDate: 0)
                }
                <<< TextRow(){ row in
                    row.title = "Birth Place"
                    row.tag = "place_of_birth"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< SegmentedRow<String>(){
                    $0.title = ""
                    $0.tag = "gender"
                    $0.options = ["Male", "Female"]
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            
                        }
                }
                <<< SegmentedRow<String>(){
                    $0.title = ""
                    $0.tag = "civil_status"
                    $0.options = ["Single", "Married", "Widowed"]
                    
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            
                        }
                }
                <<< TextRow(){ row in
                    row.title = "Address"
                    row.tag = "address"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< TextRow(){ row in
                    row.title = "Zip Code"
                    row.tag = "zip_code"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                
                <<< TextRow(){ row in
                    row.title = "Gross Income"
                    row.tag = "gross_income"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< TextRow(){ row in
                    row.title = "Tin Number"
                    row.tag = "tin_no"
                    
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                <<< TextRow(){ row in
                    row.title = "Profession"
                    row.tag = "profession"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }
                
                <<< TextRow(){ row in
                    row.title = "Weight (kilograms)"
                     row.tag = "weight"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                }
                <<< TextRow(){ row in
                    row.title = "Height (inches)"
                     row.tag = "height"
                    row.placeholder = ""
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }


                /*
                <<< TextRow(){ row in
                    row.title = "CTC Number"
                     row.tag = "ctc_no"
                    
                    row.add(rule: RuleRequired())
                    row.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }*/
   

       


        
                /*
                <<< PhoneRow(){
                    $0.title = "Contact Number"
                     $0.tag = "contact_no"
                    
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }*/
                /*
                <<< TextRow(){
                    $0.title = "Control Number"
                     $0.tag = "control_no"
                    
                    $0.add(rule: RuleRequired())
                    $0.validationOptions = .validatesOnChange
                    }.cellUpdate { cell, row in
                        if !row.isValid {
                            cell.textField.textColor = .red
                        }
                }*/

    
   
//                <<< TextRow(){ row in
//                    row.title = "Street"
//                    row.placeholder = "Enter text here"
//                }
//                +++ Section(" Address")
//                <<< TextRow(){ row in
//                    row.title = "Street"
//                    row.placeholder = "Enter text here"
//                }
//                <<< TextRow(){ row in
//                    row.title = "Subdivision"
//                    row.placeholder = "Enter text here"
//                }
//                <<< TextRow(){ row in
//                    row.title = "Municipality"
//                    row.placeholder = "Enter text here"
//                }
//                <<< TextRow(){ row in
//                    row.title = "Government ID"
//                    row.placeholder = "Enter text here"
//                }
//
//
//

        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
            
        }
        
        URLRow.defaultCellUpdate = { cell, row in cell.textField.textColor = .blue }
        LabelRow.defaultCellUpdate = { cell, row in cell.detailTextLabel?.textColor = .orange  }
        CheckRow.defaultCellSetup = { cell, row in cell.tintColor = .orange }
        DateRow.defaultRowInitializer = { row in row.minimumDate = Date() }
        
//        form +++
//
//            Section()
//
//            <<< LabelRow () {
//                $0.title = "LabelRow"
//                $0.value = "tap the row"
//                }
//                .onCellSelection { cell, row in
//                    row.title = (row.title ?? "") + " 🇺🇾 "
//                    row.reload() // or row.updateCell()
//            }
//
//            <<< DateRow() { $0.value = Date(); $0.title = "DateRow" }
//
//            <<< CheckRow() {
//                $0.title = "CheckRow"
//                $0.value = true
//            }
//
//            <<< SwitchRow() {
//                $0.title = "SwitchRow"
//                $0.value = true
//            }
//
//            <<< SliderRow() {
//                $0.title = "SliderRow"
//                $0.value = 5.0
//                }
//                .cellSetup { cell, row in
//                    cell.imageView?.image = #imageLiteral(resourceName: "selected")
//            }
//
//            <<< StepperRow() {
//                $0.title = "StepperRow"
//                $0.value = 1.0
//                }.cellSetup({ (cell, row) in
//                    cell.imageView?.image = #imageLiteral(resourceName: "selectedRectangle")
//                })
//
//
//            +++ Section("SegmentedRow examples")
//
//            <<< SegmentedRow<String>() { $0.options = ["One", "Two", "Three"] }
//
//            <<< SegmentedRow<Emoji>(){
//                $0.title = "Who are you?"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻 ]
//                $0.value = 🍐
//            }
//
//            <<< SegmentedRow<String>(){
//                $0.title = "SegmentedRow"
//                $0.options = ["One", "Two"]
//                }.cellSetup { cell, row in
//                    cell.imageView?.image = UIImage(named: "plus_image")
//            }
//
//            <<< SegmentedRow<String>(){
//                $0.options = ["One", "Two", "Three", "Four"]
//                $0.value = "Three"
//                }.cellSetup { cell, row in
//                    cell.imageView?.image = UIImage(named: "plus_image")
//            }
//
//            <<< SegmentedRow<UIImage>(){
//                let names = ["selected", "plus_image", "unselected"]
//                $0.options = names.map { UIImage(named: $0)! }
//                $0.value = $0.options?.last
//            }
//
//            +++ Section("Selectors Rows Examples")
//
//            <<< ActionSheetRow<String>() {
//                $0.title = "ActionSheetRow"
//                $0.selectorTitle = "Your favourite player?"
//                $0.options = ["Diego Forlán", "Edinson Cavani", "Diego Lugano", "Luis Suarez"]
//                $0.value = "Luis Suarez"
//                }
//                .onPresent { from, to in
//                    to.popoverPresentationController?.permittedArrowDirections = .up
//            }
//
//            <<< AlertRow<Emoji>() {
//                $0.title = "AlertRow"
//                $0.cancelTitle = "Dismiss"
//                $0.selectorTitle = "Who is there?"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
//                $0.value = 👦🏼
//                }.onChange { row in
//                    print(row.value ?? "No Value")
//                }
//                .onPresent{ _, to in
//                    to.view.tintColor = .purple
//            }
//
//            <<< PushRow<Emoji>() {
//                $0.title = "PushRow"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
//                $0.value = 👦🏼
//                $0.selectorTitle = "Choose an Emoji!"
//                }.onPresent { from, to in
//                    to.dismissOnSelection = false
//                    to.dismissOnChange = false
//            }
//
//            <<< PushRow<Emoji>() {
//                $0.title = "SectionedPushRow"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
//                $0.value = 👦🏼
//                $0.selectorTitle = "Choose an Emoji!"
//                }.onPresent { from, to in
//                    to.dismissOnSelection = false
//                    to.dismissOnChange = false
//                    to.sectionKeyForValue = { option in
//                        switch option {
//                        case 💁🏻, 👦🏼: return "People"
//                        case 🐗, 🐼, 🐻: return "Animals"
//                        case 🍐: return "Food"
//                        default: return ""
//                        }
//                    }
//            }
//            <<< PushRow<Emoji>() {
//                $0.title = "LazySectionedPushRow"
//                $0.value = 👦🏼
//                $0.selectorTitle = "Choose a lazy Emoji!"
//                $0.optionsProvider = .lazy({ (form, completion) in
//                    let activityView = UIActivityIndicatorView(style: .gray)
//                    form.tableView.backgroundView = activityView
//                    activityView.startAnimating()
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
//                        form.tableView.backgroundView = nil
//                        completion([💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻])
//                    })
//                })
//                }
//                .onPresent { from, to in
//                    to.sectionKeyForValue = { option -> String in
//                        switch option {
//                        case 💁🏻, 👦🏼: return "People"
//                        case 🐗, 🐼, 🐻: return "Animals"
//                        case 🍐: return "Food"
//                        default: return ""
//                        }
//                    }
//            }
//
//            <<< PushRow<Emoji>() {
//                $0.title = "Custom Cell Push Row"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
//                $0.value = 👦🏼
//                $0.selectorTitle = "Choose an Emoji!"
//                }
//                .onPresent { from, to in
//                    to.selectableRowSetup = { row in
//                        row.cellProvider = CellProvider<ListCheckCell<Emoji>>(nibName: "EmojiCell", bundle: Bundle.main)
//                    }
//                    to.selectableRowCellUpdate = { cell, row in
//                        var detailText: String?
//                        switch row.selectableValue {
//                        case 💁🏻, 👦🏼: detailText = "Person"
//                        case 🐗, 🐼, 🐻: detailText = "Animal"
//                        case 🍐: detailText = "Food"
//                        default: detailText = ""
//                        }
//                        cell.detailTextLabel?.text = detailText
//                    }
//        }
//
//
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            let section = form.last!
//
//            section <<< PopoverSelectorRow<Emoji>() {
//                $0.title = "PopoverSelectorRow"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
//                $0.value = 💁🏻
//                $0.selectorTitle = "Choose an Emoji!"
//            }
//        }
//
//        let section = form.last!
//
//        section
//            <<< LocationRow(){
//                $0.title = "LocationRow"
//                $0.value = CLLocation(latitude: -34.91, longitude: -56.1646)
//            }
//
//            <<< MultipleSelectorRow<Emoji>() {
//                $0.title = "MultipleSelectorRow"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
//                $0.value = [👦🏼, 🍐, 🐗]
//                }
//                .onPresent { from, to in
//                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(RegisterUser.multipleSelectorDone(_:)))
//            }
//
//            <<< MultipleSelectorRow<Emoji>() {
//                $0.title = "SectionedMultipleSelectorRow"
//                $0.options = [💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻]
//                $0.value = [👦🏼, 🍐, 🐗]
//                }
//                .onPresent { from, to in
//                    to.sectionKeyForValue = { option in
//                        switch option {
//                        case 💁🏻, 👦🏼: return "People"
//                        case 🐗, 🐼, 🐻: return "Animals"
//                        case 🍐: return "Food"
//                        default: return ""
//                        }
//                    }
//                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(RegisterUser.multipleSelectorDone(_:)))
//            }
//            <<< MultipleSelectorRow<Emoji>() {
//                $0.title = "LazyMultipleSelectorRow"
//                $0.value = [👦🏼, 🍐, 🐗]
//                $0.optionsProvider = .lazy({ (form, completion) in
//                    let activityView = UIActivityIndicatorView(style: .gray)
//                    form.tableView.backgroundView = activityView
//                    activityView.startAnimating()
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
//                        form.tableView.backgroundView = nil
//                        completion([💁🏻, 🍐, 👦🏼, 🐗, 🐼, 🐻])
//                    })
//                })
//                }.onPresent { from, to in
//                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(RegisterUser.multipleSelectorDone(_:)))
//        }
//
//        form +++ Section("Generic picker")
//
//            <<< PickerRow<String>("Picker Row") { (row : PickerRow<String>) -> Void in
//
//                row.options = []
//                for i in 1...10{
//                    row.options.append("option \(i)")
//                }
//            }
//
//            <<< PickerInputRow<String>("Picker Input Row"){
//                $0.title = "Options"
//                $0.options = []
//                for i in 1...10{
//                    $0.options.append("option \(i)")
//                }
//                $0.value = $0.options.first
//            }
//
//            <<< DoublePickerInlineRow<String, Int>() {
//                $0.title = "2 Component picker"
//                $0.firstOptions = { return ["a", "b", "c"]}
//                $0.secondOptions = { _ in return [1, 2, 3]}
//            }
//            <<< TriplePickerInputRow<String, String, Int>() {
//                $0.firstOptions = { return ["a", "b", "c"]}
//                $0.secondOptions = { return [$0, $0 + $0, $0 + "-" + $0, "asd"]}
//                $0.thirdOptions = { _,_ in return [1, 2, 3]}
//                $0.title = "3 Component picker"
//            }
//
//            +++ Section("FieldRow examples")
//
//            <<< TextRow() {
//                $0.title = "TextRow"
//                $0.placeholder = "Placeholder"
//            }
//
//            <<< DecimalRow() {
//                $0.title = "DecimalRow"
//                $0.value = 5
//                $0.formatter = DecimalFormatter()
//                $0.useFormatterDuringInput = true
//                //$0.useFormatterOnDidBeginEditing = true
//                }.cellSetup { cell, _  in
//                    cell.textField.keyboardType = .numberPad
//            }
//
//            <<< URLRow() {
//                $0.title = "URLRow"
//                $0.value = URL(string: "http://xmartlabs.com")
//            }
//
//            <<< PhoneRow() {
//                $0.title = "PhoneRow (disabled)"
//                $0.value = "+598 9898983510"
//                $0.disabled = true
//            }
//
//            <<< NameRow() {
//                $0.title =  "NameRow"
//            }
//
//            <<< PasswordRow() {
//                $0.title = "PasswordRow"
//                $0.value = "password"
//            }
//
//            <<< IntRow() {
//                $0.title = "IntRow"
//                $0.value = 2015
//            }
//
//            <<< EmailRow() {
//                $0.title = "EmailRow"
//                $0.value = "a@b.com"
//            }
//
//            <<< TwitterRow() {
//                $0.title = "TwitterRow"
//                $0.value = "@xmartlabs"
//            }
//
//            <<< AccountRow() {
//                $0.title = "AccountRow"
//                $0.placeholder = "Placeholder"
//            }
//
//            <<< ZipCodeRow() {
//                $0.title = "ZipCodeRow"
//                $0.placeholder = "90210"
//        }

    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func showAlert() {
        
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Success!", message:
                "Please visit this page to keep up to date with your application", preferredStyle: .alert)
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
    
    @objc func submitButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileName.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func getSavedImage(named: String) -> String? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return dir.path.appending(named)
        }
        return nil
    }
    
    func upload(src: String) {
        let results = self.form.validate()

        if !results.isEmpty {
            self.showErrorAlert()
            return
        }
        let emailaddr = self.form.rowBy(tag: "emailAddr")!.value ?? ""
        
        let address = self.form.rowBy(tag: "address")!.value ?? "null"
        let birtdate =       BarangayUtil().dateFormatter(date: (self.form.rowBy(tag: "date") as! DateRow).value! )
        let createdate = BarangayUtil().dateFormatter(date: Date())
        let firstname = self.form.rowBy(tag: "firstname")!.value ?? "null"
        let lastname = self.form.rowBy(tag: "lastname")!.value ?? "null"
        let mobilenumber = self.form.rowBy(tag: "mobilenumber")!.value ?? "null"
        let zipcode = self.form.rowBy(tag: "zip_code")!.value ?? "null"
        let attachment_id = src

        let civilStatus = self.form.rowBy(tag: "civil_status")!.value ?? "null"
        let tinNo = self.form.rowBy(tag: "tin_no")!.value ?? "null"
        let placeOfBirth = self.form.rowBy(tag: "place_of_birth")!.value ?? "null"
        let weight = self.form.rowBy(tag: "weight")!.value ?? "null"
        let height = self.form.rowBy(tag: "height")!.value ?? "null"
        let profession = self.form.rowBy(tag: "profession")!.value ?? "null"
        let grossIncome = self.form.rowBy(tag: "gross_income")!.value ?? "null"
        let username = self.form.rowBy(tag: "username")!.value ?? "null"
        let password = self.form.rowBy(tag: "password")!.value ?? "null"
        let gender = self.form.rowBy(tag: "gender")!.value ?? "null"
        let headers = [
            "Content-Type": "application/json",
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "Accept-Encoding": "gzip, deflate",
            "Content-Length": "669",
            "Connection": "keep-alive",
        ]
        

        let parameters = [

            "user_id": emailaddr,
            "username": emailaddr ,
            "password": password,
            "address": address,
            "birthdate": birtdate,
            "createdate": createdate,
            "firstname": firstname,
            "lastname": lastname,
            "mobilenumber": mobilenumber,
            "zipcode": zipcode,
            "civil_status": civilStatus,
            "ctc_no": String(Double.random(in: 2.71828...3.14159)),
            "tin_no": tinNo,
            "place_of_birth": placeOfBirth,
            "weight": weight,
            "height": height,
            "control_no": String(Double.random(in: 2.71828...3.14159)),
            "contact_no": mobilenumber,
            "profession": profession,
            "gross_income": grossIncome,
            "attachment_id": "hello",
            "gender": gender,
            "status": "NEW"
            ] as [String : Any]
        
 
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])

        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/user")! as URL,
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
                print(httpResponse?.statusCode)
                print(httpResponse.debugDescription)
                if httpResponse?.statusCode == 200 {
                    self.awsSignUp(username: username, password: password)
                }else{
                       self.showErrorAlert()
                }
                
            }
        })

        dataTask.resume()
    }
    
    func awsSignUp(username: String, password: String) {
        
        AWSMobileClient.sharedInstance().signUp(username: username,
                                                password: password) { (signUpResult, error) in
                                                    if let signUpResult = signUpResult {
                                                        switch(signUpResult.signUpConfirmationState) {
                                                        case .confirmed:
                                                            print("User is signed up and confirmed.")
                                                            self.printableAlert(message: "User is signed up and confirmed!")
                                                        case .unconfirmed:
                                                        //open confirm sign up
                                                            self.printableAlert(message: "An administrator will confirm your sign up!")
                                                        case .unknown:
                                                            self.printableAlert(message: "Please wait for your confirmation email.")
                                                        }
                                                    } else if let error = error {
                                                        if let error = error as? AWSMobileClientError {
                                                            let printableMessage: String
                                                            switch error {
                                                            case .aliasExists(let message): printableMessage = message
                                                            case .codeDeliveryFailure(let message): printableMessage = message
                                                            case .codeMismatch(let message): printableMessage = message
                                                            case .expiredCode(let message): printableMessage = message
                                                            case .groupExists(let message): printableMessage = message
                                                            case .internalError(let message): printableMessage = message
                                                            case .invalidLambdaResponse(let message): printableMessage = message
                                                            case .invalidOAuthFlow(let message): printableMessage = message
                                                            case .invalidParameter(let message): printableMessage = message
                                                            case .invalidPassword(let message): printableMessage = message
                                                            case .invalidUserPoolConfiguration(let message): printableMessage = message
                                                            case .limitExceeded(let message): printableMessage = message
                                                            case .mfaMethodNotFound(let message): printableMessage = message
                                                            case .notAuthorized(let message): printableMessage = message
                                                            case .passwordResetRequired(let message): printableMessage = message
                                                            case .resourceNotFound(let message): printableMessage = message
                                                            case .scopeDoesNotExist(let message): printableMessage = message
                                                            case .softwareTokenMFANotFound(let message): printableMessage = message
                                                            case .tooManyFailedAttempts(let message): printableMessage = message
                                                            case .tooManyRequests(let message): printableMessage = message
                                                            case .unexpectedLambda(let message): printableMessage = message
                                                            case .userLambdaValidation(let message): printableMessage = message
                                                            case .userNotConfirmed(let message): printableMessage = message
                                                            case .userNotFound(let message): printableMessage = message
                                                            case .usernameExists(let message): printableMessage = message
                                                            case .unknown(let message): printableMessage = message
                                                            case .notSignedIn(let message): printableMessage = message
                                                            case .identityIdUnavailable(let message): printableMessage = message
                                                            case .guestAccessNotAllowed(let message): printableMessage = message
                                                            case .federationProviderExists(let message): printableMessage = message
                                                            case .cognitoIdentityPoolNotConfigured(let message): printableMessage = message
                                                            case .unableToSignIn(let message): printableMessage = message
                                                            case .invalidState(let message): printableMessage = message
                                                            case .userPoolNotConfigured(let message): printableMessage = message
                                                            case .userCancelledSignIn(let message): printableMessage = message
                                                            case .badRequest(let message): printableMessage = message
                                                            case .expiredRefreshToken(let message): printableMessage = message
                                                            case .errorLoadingPage(let message): printableMessage = message
                                                            case .securityFailed(let message): printableMessage = message
                                                            case .idTokenNotIssued(let message): printableMessage = message
                                                            case .idTokenAndAcceessTokenNotIssued(let message): printableMessage = message
                                                            case .invalidConfiguration(let message): printableMessage = message
                                                            case .deviceNotRemembered(let message): printableMessage = message
                                                            }
                                                           
                                                            print("error: \(error); message: \(printableMessage)")
                                                            self.printableAlert(message: printableMessage)
                                                        }
                                                        
                                                        print("\(error.localizedDescription)")
                                                    }
        }
        
    }
    
    func printableAlert(message:String) {
        
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Barangay e-Message", message:
                message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            
            self.present(alertController, animated: true, completion: {
                self.dismiss(animated: true, completion: nil)
            })
        }
        
        
    }
    @objc func tappedDone(){
        
        
         self.upload(src: "")
        

//           let user_id = "\(CGFloat.random(in: 1...1000))"
//        let image = form.rowBy(tag: "passport")! as? ImageRow
//        var src: String = ""
//        guard let imageValue = image?.value else{return}
//        let success = saveImage(image: imageValue)
//        if let imageSrc = getSavedImage(named: "/fileName.png") {
//            // do something with image
//            //uploadImage
//            print(imageSrc)
//            ImageUploader().upload(imgSrc: imageSrc, imgName: user_id, completionBlock: {
//                data, error  in
//                src = data!.absoluteString!
//                self.upload(src: src)
//
//            })
//        }
        
 
  

       
    }
    

}


