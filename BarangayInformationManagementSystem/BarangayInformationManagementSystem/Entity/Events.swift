//
//  Events.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct  Events:Codable {
    
    var event_id: Int
    
    var event_description: Int
    
    var start_date: String
    
    var end_date: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case event_id = "clearance_id"
        
        case event_description = "user_id"
        
        case start_date = "start_date"
        
        case end_date = "end_date"
        
        
        
        
    }
    
    // MARK: - Decodable
    
    
    
}
