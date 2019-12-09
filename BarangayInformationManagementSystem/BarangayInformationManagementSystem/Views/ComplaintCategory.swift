//
//  ComplaintCategory.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 12/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton

open class ComplaintCategory: UIViewController {
    
    
    override open func viewDidLoad() {
        
        
    
    }
    
    @IBAction func closeButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        

        let vc: ComplaintsDetail = (segue.destination as? ComplaintsDetail)!
        
        
        

        if segue.identifier == "carSegue" {
            vc.category = "Accident"
        }
        if segue.identifier == "noiseSegue" {
              vc.category = "Noise"
        }
        if segue.identifier == "stormSegue" {
              vc.category = "Storm"
        }
        if segue.identifier == "pestSegue" {
            vc.category = "Pest"
        }
        if segue.identifier == "publicSegue" {
            vc.category = "Public"
        }
        if segue.identifier == "epidemicSegue" {
            vc.category = "Epidemic"
        }
        if segue.identifier == "carSegue" {
            vc.category = "Car"
        }
        if segue.identifier == "trashSegue" {
            vc.category = "Trash"
        }
        if segue.identifier == "dogSegue" {
            vc.category = "Dog"
        }
        if segue.identifier == "disputeSegue" {
             vc.category = "Dispute"
        }
    }
    
    @IBAction func accidentAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                    vc.category = "Accident"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: {
                        self.dismiss(animated: true, completion: nil)
                    })
                })
            })
        })
    }
    
    @IBAction func noiseAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                      vc.category = "Noise"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    
    @IBAction func stormAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                      vc.category = "Storm"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    
    @IBAction func pestAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                    vc.category = "Pest"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    
    @IBAction func publicAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                     vc.category = "Public"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    
    @IBAction func epidemicAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                    vc.category = "Epidemic"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    
    @IBAction func carAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                    vc.category = "Car"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    
    @IBAction func trashAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                    let navigationController = UINavigationController(rootViewController: vc)
                    vc.category = "Trash"
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    @IBAction func dogAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                     vc.category = "Dog"
                    
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    @IBAction func disputeAction(_ button: TransitionButton) {
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ComplaintsDetail") as! ComplaintsDetail
                     vc.category = "Dispute"
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
   
}
