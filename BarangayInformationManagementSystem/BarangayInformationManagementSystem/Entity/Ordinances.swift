//
//  Ordinances.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct  Ordinances:Codable {
    
    var ordinance_id: Int
    
    var ordinance_desc: String
    
    var ordinance_title: String
    
    var ordinance_date: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case ordinance_id = "ordinance_id"
        
        case ordinance_desc = "ordinance_desc"
        
        case ordinance_title = "ordinance_title"
        
        case ordinance_date = "ordinance_date"
        
        
        
        
    }
    
    // MARK: - Decodable
    
    
    
}
