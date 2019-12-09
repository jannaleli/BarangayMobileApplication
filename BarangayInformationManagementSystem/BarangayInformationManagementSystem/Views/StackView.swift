//
//  StackView.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 25/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import UIKit
import FoldingCell
import SwiftyAvatar
class StackView: UITableViewCell {
    
    @IBOutlet private var nameLabel: UITextView!
    @IBOutlet private var prepTimeLabel: UILabel!
    @IBOutlet private var thumbnailImageView: UIImageView!
    @IBOutlet private var titleView: UITextView!
    @IBOutlet private var subtitleview: UITextView!
    @IBOutlet private var smallImageView: SwiftyAvatar!
    
    // MARK: Cell Configuration
    
    func configurateTheCell(_ recipe: Events) {
        
        nameLabel.text = recipe.event_title
        prepTimeLabel.text = "Publish Date: \(recipe.event_date)"
      //  thumbnailImageView.image = UIImage(data: recipe.thumbnails)
        smallImageView.image = UIImage(data: recipe.thumbnails)

    }
    


    
}

