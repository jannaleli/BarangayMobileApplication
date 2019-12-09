//
//  EmergencyViewController.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 11/9/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import UIKit
class EmergencyViewController : UIViewController {
    @IBAction func callPhone() {
        guard let number = URL(string: "tel://" + "96773814") else { return }
        UIApplication.shared.open(number)
    }
}
