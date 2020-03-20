//
//  TabBarController.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 13/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        navigationItem.title = "Barangay Loma De Gato"
        let logout = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logoutFun))
        
        navigationItem.rightBarButtonItems = [logout]
    }
    
    @objc func logoutFun(){
        UserDefaults.standard.removeObject(forKey: "Username")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginCoordinator") as! LoginCoordinator
        //   let navigationController = UINavigationController(rootViewController: vc)
        
        self.present(vc, animated: true, completion: nil)
    }
}
