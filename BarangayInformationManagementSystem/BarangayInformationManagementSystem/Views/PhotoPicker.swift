//
//  PhotoPicker.swift
//  BarangayInformationManagementSystem
//
//  Created by Jann Aleli Castillo Zaplan on 9/7/19.
//  Copyright © 2019 Jann Aleli Zaplan. All rights reserved.
//

//import Foundation
//import UIKit
//import AWSS3
//import  AWSAPIGateway
//import AWSCore
//public protocol ImagePickerDelegate: class {
//    func didSelect(image: UIImage?, imageSrc: String?)
//}
//
//
//open class ImagePicker: NSObject {
//    
//    private let pickerController: UIImagePickerController
//    private weak var presentationController: UIViewController?
//    private weak var delegate: ImagePickerDelegate?
//    
//    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
//        self.pickerController = UIImagePickerController()
//        
//        super.init()
//        
//        self.presentationController = presentationController
//        self.delegate = delegate
//        
//        self.pickerController.delegate = self
//        self.pickerController.allowsEditing = true
//        self.pickerController.mediaTypes = ["public.image"]
//    }
//    
//    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
//        guard UIImagePickerController.isSourceTypeAvailable(type) else {
//            return nil
//        }
//        
//        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
//            self.pickerController.sourceType = type
//            self.presentationController?.present(self.pickerController, animated: true)
//        }
//    }
//    
//    public func present(from sourceView: UIView) {
//        
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        
//        if let action = self.action(for: .camera, title: "Take photo") {
//            alertController.addAction(action)
//        }
//        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
//            alertController.addAction(action)
//        }
//        if let action = self.action(for: .photoLibrary, title: "Photo library") {
//            alertController.addAction(action)
//        }
//        
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            alertController.popoverPresentationController?.sourceView = sourceView
//            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
//            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
//        }
//        
//        self.presentationController?.present(alertController, animated: true)
//    }
//    
//    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?, imgSrc: String?) {
//        controller.dismiss(animated: true, completion: nil)
//        
//        self.delegate?.didSelect(image: image, imageSrc: imgSrc)
//    }
//}
//
//extension ImagePicker: UIImagePickerControllerDelegate {
//    
//    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        self.pickerController(picker, didSelect: nil, imgSrc: nil)
//    }
//    
//    public func imagePickerController(_ picker: UIImagePickerController,
//                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        guard let image = info[.editedImage] as? UIImage else {
//            return self.pickerController(picker, didSelect: nil, imgSrc: nil )
//        }
//       
//        let imgSrc = info[.imageURL]
//        print(imgSrc)
//        self.pickerController(picker, didSelect: image, imgSrc:imgSrc.debugDescription)
//    }
//}
//
//extension ImagePicker: UINavigationControllerDelegate {
//    
//}
//class PhotoPicker: UIViewController {
//    
//    @IBOutlet var imageView: UIImageView!
//    
//    var imagePicker: ImagePicker!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
//    }
//    
//    @IBAction func showImagePicker(_ sender: UIButton) {
//        self.imagePicker.present(from: sender)
//    }
//}
//
//extension PhotoPicker: ImagePickerDelegate {
//    func didSelect(image: UIImage?, imageSrc: String?) {
//       
//        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "identity pool id")
//        let configuration = AWSServiceConfiguration(region: .apSoutheast1, credentialsProvider: credentialProvider)
//        AWSServiceManager.default().defaultServiceConfiguration = configuration
//        
//        //these are the static values I used that worked perfectly fine with separate images
//        //let localFileName = "Alerts_bg"
//        //let ext = "png"
//        //let remoteName = localFileName + "." + ext
//        //let imageURL = Bundle.main.url(forResource: localFileName, withExtension: ext)!
//        
//        let transferManager = AWSS3TransferManager.default()
//        
//        let uploadRequest = AWSS3TransferManagerUploadRequest()!
//        uploadRequest.bucket = "bucket"
//        let imageAWSName = "ios_" + NSUUID().uuidString + ".jpg"
//        uploadRequest.key = imageAWSName
//        uploadRequest.body = URL(fileURLWithPath: imageSrc!) as URL
//        uploadRequest.contentType = "image/jpg"
//        
//        print("req123 : \(uploadRequest)")
//        
//        uploadRequest.uploadProgress = { (bytesSent, totalBytesSent, totalBytesExpectedToSend) -> Void in
//            DispatchQueue.main.async(execute: {
//                //self.amountUploaded = totalBytesSent // To show the updating data status in label.
//                //self.fileSize = totalBytesExpectedToSend
//                print("progress : \(totalBytesSent)/\(totalBytesExpectedToSend)")
//            })
//        }
//        
//        transferManager?.upload(uploadRequest)?.continue(with: AWSExecutor.mainThread(), withSuccessBlock:  { (task:AWSTask<AnyObject>) -> Any? in
//            if let error = task.error {
//            print("Upload failed with error: (\(error.localizedDescription))")
//            }
//            if task.result != nil {
//            
//            let s3URL = URL(string: "https://s3-ap-southeast-1.amazonaws.com/bucket/\(imageAWSName)")!
//            print("Uploaded to:\(s3URL)")
//            }
//            return nil
//            })
//        
//        dismiss(animated:true, completion: nil) //5
//    }
//    
//
//    
//  
//}
