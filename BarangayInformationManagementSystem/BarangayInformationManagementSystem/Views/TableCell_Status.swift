//
//  TableCell_Status.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 20/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//


import Foundation
import UIKit

class TableCell_Status: UITableViewCell {
    
    @IBOutlet private var nameLabel: UITextView!
    @IBOutlet private var statusImage: UIImageView!
    @IBOutlet private var dateApplied: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        statusImage.image = nil

    }
    
    // MARK: Cell Configuration
    
    func configurateTheCell(_ recipe: Recipe) {
        nameLabel.text = "\(recipe.name)"
        if recipe.date == "NEW" {
            statusImage.image = UIImage(named: "pending")
        }else if recipe.date == "APPROVED" {
             statusImage.image = UIImage(named: "approved")
        }else if recipe.date == "REJECTED" {
            
             statusImage.image = UIImage(named: "rejected")
        }
        //let date = "07/07/1990"
        //dateApplied.text = "Applied on \(date)"
   
    }

}
