//
//  Clearance.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import UIKit
import LGButton
import TransitionButton
import GoogleMobileAds
 class Clearance: UIViewController, GADBannerViewDelegate {
    @IBOutlet weak var applyClearance: TransitionButton!
    @IBOutlet weak var applyBusinessPermit: TransitionButton!
    @IBOutlet weak var checkStatus: TransitionButton!
    @IBOutlet weak var  adBannerView: GADBannerView!
        
        /*= {
        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView.adUnitID = "ca-app-pub-7625476876021461/7791440517"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        
        return adBannerView
    }()*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adBannerView.adSize = kGADAdSizeBanner
        adBannerView.adUnitID = "ca-app-pub-7625476876021461/7791440517"
        
        adBannerView.delegate = self
       adBannerView.rootViewController = self
        let adReq = GADRequest()
        adReq.testDevices = [kGADSimulatorID]
         adBannerView.load(adReq)
        applyClearance.addTarget(self, action: #selector(applyButton(_:)), for: .touchUpInside)
        applyBusinessPermit.addTarget(self, action: #selector(applyBusinessPermitAction(_:)), for: .touchUpInside)
        checkStatus.addTarget(self, action: #selector(checkStatusButtonAction(_:)), for: .touchUpInside)
    
     
    }
   
    @IBAction func applyButton(_ button: TransitionButton) {
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
                    let vc = storyboard.instantiateViewController(withIdentifier: "BarangayClearance") as! BarangayClearance
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    @IBAction func applyBusinessPermitAction(_ button: TransitionButton) {
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
                    let vc = storyboard.instantiateViewController(withIdentifier: "BusinessPermits") as! BusinessPermits
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    
    @IBAction func checkStatusButtonAction(_ button: TransitionButton) {
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
                    let vc = storyboard.instantiateViewController(withIdentifier: "StatusViewController") as! StatusViewController
                    let navigationController = UINavigationController(rootViewController: vc)
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Banner loaded successfully")
      //  adBannerView.addSubview(bannerView)
    
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to receive ads")
        print(error)
    }
}
