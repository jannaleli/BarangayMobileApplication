//
//  DetailViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UITextView!
    @IBOutlet var prepTime: UITextView!
    @IBOutlet var buttonClose: UIButton!

    
    open var recipe: Events?
     @objc func tappedDone(){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.title = "Event Details"
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DetailViewController.tappedDone))
        button.title = "Submit"
        navigationItem.rightBarButtonItem = button
        if let recipe = recipe {
            //navigationItem.title = recipe.event_title
            imageView.image = UIImage(data: recipe.thumbnails)
            nameLabel.text = recipe.event_title
            prepTime.text = recipe.event_desc
        }
    }
}
