

import Foundation
import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet private var nameLabel: UITextView!
    @IBOutlet private var prepTimeLabel: UITextView!
    @IBOutlet private var thumbnailImageView: UIImageView!
  
    
    // MARK: Cell Configuration
    

    func configurateTheEventCell(_ recipe: Events) {
        nameLabel.text = recipe.event_title
        prepTimeLabel.text =  recipe.event_desc
        thumbnailImageView.image = UIImage(data: recipe.thumbnails)
    }
}
