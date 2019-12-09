//
//  ConfirmSignUp.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 28/9/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient
class ConfirmSignUpViewController : UIViewController {
    @IBOutlet weak var confirmField: SkyFloatingLabelTextField!
   
    @IBAction func confirm() {
        let confirmationCode = self.confirmField!.text!
        let username = UserDefaults.standard.string(forKey: "Username")!
        
        AWSMobileClient.sharedInstance().confirmSignUp(username: username, confirmationCode: confirmationCode, completionHandler: {
            (signUpResult, error) in
                            if let signUpResult = signUpResult {
                                    switch(signUpResult.signUpConfirmationState) {
                                            case .confirmed:
                                            print("User is signed up and confirmed.")
                                            case .unconfirmed:
                                            print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                                                                    //open confirm sign up
                                            case .unknown:
                                            print("Unexpected case")
                                    }
                            } else if let error = error {
                                if let error = error as? AWSMobileClientError {
                                    switch(error) {
                                    case .usernameExists(let message):
                                    print(message)
                                    default:
                                    break
                                    }
                            }
                            print("\(error.localizedDescription)")
                                                                }
                    }
        )
        
    }
}
