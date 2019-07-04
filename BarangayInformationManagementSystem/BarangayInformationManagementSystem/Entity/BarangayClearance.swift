//
//  BarangayClearance.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct  BarangayClearance:Codable {
    
    var clearanceId: Int
    
    var userId: Int
    
    var requestDate: String
    
    var approvalDate: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case clearanceId = "clearance_id"
        
        case userId = "user_id"
        
        case requestDate = "request_date"
        
        case approvalDate = "approval_date"
        
        
        
        
    }
    
    // MARK: - Decodable
    
    
    
}
