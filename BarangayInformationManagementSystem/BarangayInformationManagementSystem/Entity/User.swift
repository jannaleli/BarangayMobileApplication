//
//  User.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//


import Foundation
import CoreData
import UIKit

struct  User:Codable {
    
    var userId: String
    
    var firstName: String
    
    var lastName: String
    
    var address: String
    
    var governmentId: String
    
    var password: String
    
    enum CodingKeys: String, CodingKey {
        
        case userId = "user_id"
        
        case firstName = "firstname"
        
        case lastName = "lastname"
        
        case address = "address"
        
        case governmentId = "government_id"
        
        case password = "password"
        
        
    }
    
    // MARK: - Decodable
    
    
    
}
