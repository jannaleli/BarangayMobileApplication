//
//  BusinessPermit.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//
import Foundation
import CoreData
import UIKit

struct  BusinessPermit:Codable {
    
    var busiessPermitId: Int
    
    var userId: Int
    
    var requestDate: String
    
    var approvalDate: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case busiessPermitId = "bp_id"
        
        case userId = "user_id"
        
        case requestDate = "request_date"
        
        case approvalDate = "approval_date"
        

        
        
    }
    
    // MARK: - Decodable
    
    
    
}
