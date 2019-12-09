//
//  Login.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 12/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import Eureka
import TweeTextField
import  UIKit
import TransitionButton
import SkyFloatingLabelTextField
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient
open class LoginUser: UIViewController {
    @IBOutlet weak var username: SkyFloatingLabelTextField!
    @IBOutlet weak var password: SkyFloatingLabelTextField!
    @IBOutlet weak var loginButton: UIButton!
    let colors = Colors()
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    
//        if !AWSSignInManager.sharedInstance().isLoggedIn {
//
//            let viewController = UIViewController()
//            let navigationController = UINavigationController(rootViewController: viewController)
//            // To present empty UINavigationController as modal without animation.
//            UIApplication.shared.delegate?.window?!.rootViewController?.present(navigationController, animated: false, completion: nil)
//            AWSAuthUIViewController
//                .presentViewController(with: navigationController,
//                                       configuration: nil,
//                                       completionHandler: { (provider: AWSSignInProvider, error: Error?) in
//                                        if error != nil {
//                                            print("Error occurred: \(String(describing: error))")
//                                        } else {
//                                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                                            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
//                                            //let navigationController = UINavigationController(rootViewController: vc)
//                                            navigationController.present(vc, animated: true, completion: nil)
//
//
//                                        }
//                })
//        }else{
//            UserDefaults.standard.set("jann.aleli@gmail.com", forKey: "Username")
//                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                                        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
//                                        let navigationController = UINavigationController(rootViewController: vc)
//            self.present(navigationController, animated: true, completion: nil)
//        }
        
//        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(LoginUser.tappedDone))
//        button.title = "Login"
//        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(LoginUser.submitButton))
//        closeButton.title = "Close"
//        navigationItem.leftBarButtonItem = closeButton
//        navigationItem.rightBarButtonItem = button
//        let backgroundLayer = colors.gl

        
//        view.backgroundColor = UIColor.clear
//        var backgroundLayer = colors.gl
//        backgroundLayer!.frame = view.frame
//        view.layer.insertSublayer(backgroundLayer!, at: 0)
//        form +++ Section("Personal Particulars")
//            <<< EmailRow(){ row in
//                row.title = "Username"
//                row.tag = "Username"
//
//                row.add(rule: RuleRequired())
//                row.validationOptions = .validatesOnChange
//                }.cellUpdate { cell, row in
//                    if !row.isValid {
//
//                    }
//            }
//            <<< PasswordRow(){ row in
//                row.title = "Password"
//
//                row.add(rule: RuleRequired())
//                row.validationOptions = .validatesOnChange
//                }.cellUpdate { cell, row in
//                    if !row.isValid {
//
//                    }
//        }
//
        
        
        
    }
    @objc func submitButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedDone(_ button: TransitionButton){
//        let results = form.validate()
//
//        if !results.isEmpty {
//            self.showErrorAlert()
//            return
//        }
//        let row: EmailRow? = form.rowBy(tag: "Username")
//        let value = row!.value ?? ""
        //bring this back later

        //button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {

            UserDefaults.standard.set(self.username.text, forKey: "Username")
            
            AWSMobileClient.sharedInstance().signIn(username: (self.username.text?.lowercased())!, password: (self.password.text)!, completionHandler: {
                (signInResult, error) in
                if let signInResult = signInResult {
                    switch(signInResult.signInState) {
                    case .signedIn:
                        DispatchQueue.main.async(execute: { () -> Void in
                            // 4: Stop the animation, here you have three options for the `animationStyle` property:
                            // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                            // .shake: when you want to reflect to the user that the task did not complete successfly
                            // .normal
                          //  button.stopAnimation(animationStyle: .expand, completion: {
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
                                let navigationController = UINavigationController(rootViewController: vc)
                                self.present(navigationController, animated: true, completion: nil)
                          //  })
                        })
                    case .adminNoSRPAuth: break
                    case .customChallenge:break
                    case .devicePasswordVerifier:break
                    case .deviceSRPAuth:break
                    case .newPasswordRequired:break
                    case .passwordVerifier:break
                    case .smsMFA:break
                    case .unknown:
                        print("Unexpected case")
                    }
                } else if let error = error {
                    if let error = error as? AWSMobileClientError {
                        let printableMessage: String
                        switch error {
                        case .aliasExists(let message): printableMessage = message
                        case .codeDeliveryFailure(let message): printableMessage = message
                        case .codeMismatch(let message): printableMessage = message
                        case .expiredCode(let message): printableMessage = message
                        case .groupExists(let message): printableMessage = message
                        case .internalError(let message): printableMessage = message
                        case .invalidLambdaResponse(let message): printableMessage = message
                        case .invalidOAuthFlow(let message): printableMessage = message
                        case .invalidParameter(let message): printableMessage = message
                        case .invalidPassword(let message): printableMessage = message
                        case .invalidUserPoolConfiguration(let message): printableMessage = message
                        case .limitExceeded(let message): printableMessage = message
                        case .mfaMethodNotFound(let message): printableMessage = message
                        case .notAuthorized(let message): printableMessage = message
                        case .passwordResetRequired(let message): printableMessage = message
                        case .resourceNotFound(let message): printableMessage = message
                        case .scopeDoesNotExist(let message): printableMessage = message
                        case .softwareTokenMFANotFound(let message): printableMessage = message
                        case .tooManyFailedAttempts(let message): printableMessage = message
                        case .tooManyRequests(let message): printableMessage = message
                        case .unexpectedLambda(let message): printableMessage = message
                        case .userLambdaValidation(let message): printableMessage = message
                        case .userNotConfirmed(let message): printableMessage = message
                        case .userNotFound(let message): printableMessage = message
                        case .usernameExists(let message): printableMessage = message
                        case .unknown(let message): printableMessage = message
                        case .notSignedIn(let message): printableMessage = message
                        case .identityIdUnavailable(let message): printableMessage = message
                        case .guestAccessNotAllowed(let message): printableMessage = message
                        case .federationProviderExists(let message): printableMessage = message
                        case .cognitoIdentityPoolNotConfigured(let message): printableMessage = message
                        case .unableToSignIn(let message): printableMessage = message
                        case .invalidState(let message): printableMessage = message
                        case .userPoolNotConfigured(let message): printableMessage = message
                        case .userCancelledSignIn(let message): printableMessage = message
                        case .badRequest(let message): printableMessage = message
                        case .expiredRefreshToken(let message): printableMessage = message
                        case .errorLoadingPage(let message): printableMessage = message
                        case .securityFailed(let message): printableMessage = message
                        case .idTokenNotIssued(let message): printableMessage = message
                        case .idTokenAndAcceessTokenNotIssued(let message): printableMessage = message
                        case .invalidConfiguration(let message): printableMessage = message
                        case .deviceNotRemembered(let message): printableMessage = message
                        }
                        print("error: \(error); message: \(printableMessage)")
                        self.printableAlert(message: printableMessage)
                    }
                }
                
            })
            
//            DefaultAPI.userUserIdGet(userId: (self.username.text?.lowercased())!, completion: {
//                model,error in
//
//                if error == nil {
//                    //success for now
//                    DispatchQueue.main.async(execute: { () -> Void in
//                        // 4: Stop the animation, here you have three options for the `animationStyle` property:
//                        // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
//                        // .shake: when you want to reflect to the user that the task did not complete successfly
//                        // .normal
//                        button.stopAnimation(animationStyle: .expand, completion: {
//                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
//                            let navigationController = UINavigationController(rootViewController: vc)
//                            self.present(navigationController, animated: true, completion: nil)
//                        })
//                    })
//
//
//
//                }
//
//            })


        })

        
    }
    
    func showAlert() {
        
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Success!", message:
                "Please visit this page to keep up to date with your application", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    func printableAlert(message:String) {
        
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Fail!", message:
                message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
    
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
    
    func showErrorAlert() {
        DispatchQueue.main.async{
            //put your code here
            let alertController = UIAlertController(title: "Error!", message:
                "Some fields required", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
}
