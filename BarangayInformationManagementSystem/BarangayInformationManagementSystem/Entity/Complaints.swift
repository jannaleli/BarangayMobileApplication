//
//  Complaints.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct  Complaints:Codable {
    
    var complaint_id: Int
    
    var complaint_desc: Int
    
    var resolution: String
    
  
    
    
    enum CodingKeys: String, CodingKey {
        
        case complaint_id = "complaint_id"
        
        case complaint_desc = "complaint_desc"
        
        case resolution = "resolution"
        
     
        
        
        
    }
    
    // MARK: - Decodable
    
    
    
}
