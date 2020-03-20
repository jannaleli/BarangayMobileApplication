//
//  ComplaintsManagement.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Zaplan Ohanae on 29/6/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton
import MapKit
import JASON
import GoogleMaps
import GooglePlaces

import CoreLocation

class ComplaintsManagement: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var myCase: TransitionButton!
    @IBOutlet weak var submitCase: TransitionButton!
    @IBOutlet weak var mapView: MKMapView!
         @IBOutlet private weak var googleMaps: GMSMapView!
    let regionRadius: CLLocationDistance = 1000
    weak var currentLocation: CLLocation?
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self as CLLocationManagerDelegate
        submitCase.addTarget(self, action: #selector(submitComplaints(_:)), for: .touchUpInside)
        
       

        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            getComplaints()
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
      
        }
        

   
        
        // set initial location in Honolulu

        
    }
    func centerMapOnLocation(location: CLLocation) {
       
       // mapView.setRegion(coordinateRegion, animated: true)
        
        DispatchQueue.main.async(execute: { () -> Void in
            // 4: Stop the animation, here you have three options for the `animationStyle` property:
            // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
            // .shake: when you want to reflect to the user that the task did not complete successfly
            // .normal
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
            self.googleMaps.camera = GMSCameraPosition(latitude: coordinateRegion.center.latitude, longitude: coordinateRegion.center.longitude, zoom: 15, bearing: 0, viewingAngle: 0)
        })
   
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
//        let initialLocation = CLLocation(latitude: 14.786354, longitude:  121.012731)
//        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
//
//        centerMapOnLocation(location: location)
//
//        let artwork = Artwork(title: "King David Kalakaua",
//                              locationName: "Waikiki Gateway Park",
//                              discipline: "Sculpture",
//                              coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
//        mapView.addAnnotation(artwork)
//        mapView.setRegion(coordinateRegion, animated: true)
        DispatchQueue.main.async(execute: { () -> Void in
            // 4: Stop the animation, here you have three options for the `animationStyle` property:
            // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
            // .shake: when you want to reflect to the user that the task did not complete successfly
            // .normal
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
            self.googleMaps.camera = GMSCameraPosition(latitude: coordinateRegion.center.latitude, longitude: coordinateRegion.center.longitude, zoom: 15, bearing: 0, viewingAngle: 0)
            
        })
        locationManager.stopUpdatingLocation()
    }
    
    
    @IBAction func submitComplaints(_ button: TransitionButton) {
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
                    self.present(navigationController, animated: true, completion: nil)
                })
            })
        })
    }
    

    @IBAction func myCasesButtonAction(_ button: TransitionButton) {
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
                    let secondVC = UIViewController()
                    self.present(secondVC, animated: true, completion: nil)
                })
            })
        })
    }
    
    func getComplaints() {
        
        let headers = [
            "Accept": "*/*",
            "Host": "mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com",
            "accept-encoding": "gzip, deflate",
            "Connection": "keep-alive"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://mjdjlvb5x9.execute-api.ap-southeast-1.amazonaws.com/prod/complaint")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                    
                    let json = JSON(data)
                    
                    
                    for each in json {
                        if each["status"].string! == "RESOLVED" {
                            break
                        }
                        DispatchQueue.main.async(execute: { () -> Void in
                            // 4: Stop the animation, here you have three options for the `animationStyle` property:
                            // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                            // .shake: when you want to reflect to the user that the task did not complete successfly
                            // .normal
                            
                            
                           
                            let locationCoordinate = CLLocationCoordinate2D(latitude: Double(each["latitude"].string!) as! CLLocationDegrees, longitude: Double(each["longitude"].string!) as! CLLocationDegrees)
                            let coordinate = MKCoordinateRegion(center: locationCoordinate, latitudinalMeters: 70, longitudinalMeters: 70)
                            //   let artwork = Artwork(title: each["complaint_desc"].string!,
                            //                         locationName: each["complaint_desc"].string!,
                            //                         discipline: each["complaint_desc"].string!,
                            //                          coordinate: CLLocationCoordinate2D(latitude: Double(each["latitude"].string!) as! CLLocationDegrees, longitude: Double(each["longitude"].string!) as! CLLocationDegrees))
                            
                            
                            //     self.mapView.addAnnotation(artwork)
                            //     self.mapView.setRegion(coordinate, animated: true)
                            let marker = GMSMarker()
                            marker.position = locationCoordinate
                            marker.title = each["complaint_desc"].string!
                            marker.snippet = each["complaint_desc"].string!
                            marker.map = self.googleMaps
                            
                            self.googleMaps.camera = GMSCameraPosition(target:locationCoordinate, zoom: 15, bearing: 0, viewingAngle: 0)
                            
                           
                        })
            
                    }
                    
                        
                    
                }
            }
        })
        
        dataTask.resume()
        

        
        
//        DefaultAPI.complaintGet(completion: {
//            models, error in
//
//        })
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            // The user denied authorization
        } else if (status == CLAuthorizationStatus.authorizedWhenInUse) {
            // The user accepted authorization
                 getComplaints()
        }
    }
    
}
