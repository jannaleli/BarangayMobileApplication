//
//  Attachment.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import CoreData
import UIKit
struct  Attahcment:Codable {
    
    var attachment_id: Int
    

    
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case attachment_id = "attachment_id"
        
      
        
        
        
        
    }
    
    // MARK: - Decodable
    
    
    
}
