//
// DefaultAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class DefaultAPI {
    /**

     - parameter attachmentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func attachmentAttachmentIdGet(attachmentId: String, completion: @escaping ((_ data: BarangayAttachmentModel?,_ error: Error?) -> Void)) {
        attachmentAttachmentIdGetWithRequestBuilder(attachmentId: attachmentId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /attachment/{attachment_id}
     - examples: [{contentType=application/json, example={
  "attachment_src" : "attachment_src",
  "attachment_id" : "attachment_id"
}}]
     
     - parameter attachmentId: (path)  

     - returns: RequestBuilder<BarangayAttachmentModel> 
     */
    open class func attachmentAttachmentIdGetWithRequestBuilder(attachmentId: String) -> RequestBuilder<BarangayAttachmentModel> {
        var path = "/attachment/{attachment_id}"
        let attachmentIdPreEscape = "\(attachmentId)"
        let attachmentIdPostEscape = attachmentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{attachment_id}", with: attachmentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayAttachmentModel>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter barangayAttachmentModel: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func attachmentPost(barangayAttachmentModel: BarangayAttachmentModel, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        attachmentPostWithRequestBuilder(barangayAttachmentModel: barangayAttachmentModel).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - POST /attachment
     
     - parameter barangayAttachmentModel: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func attachmentPostWithRequestBuilder(barangayAttachmentModel: BarangayAttachmentModel) -> RequestBuilder<Void> {
        let path = "/attachment"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: barangayAttachmentModel)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func complaintGet(completion: @escaping ((_ data: BarangayComplaintArray?,_ error: Error?) -> Void)) {
        complaintGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /complaint
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<BarangayComplaintArray> 
     */
    open class func complaintGetWithRequestBuilder() -> RequestBuilder<BarangayComplaintArray> {
        let path = "/complaint"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayComplaintArray>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter barangayComplaintModel: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func complaintPost(barangayComplaintModel: BarangayComplaintModel, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        complaintPostWithRequestBuilder(barangayComplaintModel: barangayComplaintModel).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - POST /complaint
     
     - parameter barangayComplaintModel: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func complaintPostWithRequestBuilder(barangayComplaintModel: BarangayComplaintModel) -> RequestBuilder<Void> {
        let path = "/complaint"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: barangayComplaintModel)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter documentId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func documentDocumentIdGet(documentId: String, completion: @escaping ((_ data: BarangayDocumentModel?,_ error: Error?) -> Void)) {
        documentDocumentIdGetWithRequestBuilder(documentId: documentId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /document/{document_id}
     - examples: [{contentType=application/json, example={
  "reason" : "reason",
  "user_id" : "user_id",
  "attachment_id" : "attachment_id",
  "document_id" : "document_id",
  "create_date" : "create_date",
  "approve_date" : "approve_date",
  "status" : "status"
}}]
     
     - parameter documentId: (path)  

     - returns: RequestBuilder<BarangayDocumentModel> 
     */
    open class func documentDocumentIdGetWithRequestBuilder(documentId: String) -> RequestBuilder<BarangayDocumentModel> {
        var path = "/document/{document_id}"
        let documentIdPreEscape = "\(documentId)"
        let documentIdPostEscape = documentIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{document_id}", with: documentIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayDocumentModel>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func documentGet(completion: @escaping ((_ data: BarangayDocumentArray?,_ error: Error?) -> Void)) {
        documentGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /document
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<BarangayDocumentArray> 
     */
    open class func documentGetWithRequestBuilder() -> RequestBuilder<BarangayDocumentArray> {
        let path = "/document"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayDocumentArray>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter barangayDocumentModel: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func documentPost(barangayDocumentModel: BarangayDocumentModel, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        documentPostWithRequestBuilder(barangayDocumentModel: barangayDocumentModel).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - POST /document
     
     - parameter barangayDocumentModel: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func documentPostWithRequestBuilder(barangayDocumentModel: BarangayDocumentModel) -> RequestBuilder<Void> {
        let path = "/document"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: barangayDocumentModel)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func eventGet(completion: @escaping ((_ data: BarangayEventArray?,_ error: Error?) -> Void)) {
        eventGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /event
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<BarangayEventArray> 
     */
    open class func eventGetWithRequestBuilder() -> RequestBuilder<BarangayEventArray> {
        let path = "/event"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayEventArray>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter barangayEventModel: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func eventPost(barangayEventModel: BarangayEventModel, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        eventPostWithRequestBuilder(barangayEventModel: barangayEventModel).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - POST /event
     
     - parameter barangayEventModel: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func eventPostWithRequestBuilder(barangayEventModel: BarangayEventModel) -> RequestBuilder<Void> {
        let path = "/event"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: barangayEventModel)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func permitGet(completion: @escaping ((_ data: BarangayPermitArray?,_ error: Error?) -> Void)) {
        permitGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /permit
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<BarangayPermitArray> 
     */
    open class func permitGetWithRequestBuilder() -> RequestBuilder<BarangayPermitArray> {
        let path = "/permit"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayPermitArray>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter permitId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func permitPermitIdGet(permitId: String, completion: @escaping ((_ data: BarangayPermitModel?,_ error: Error?) -> Void)) {
        permitPermitIdGetWithRequestBuilder(permitId: permitId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /permit/{permit_id}
     - examples: [{contentType=application/json, example={
  "gross_sale" : "gross_sale",
  "business_name" : "business_name",
  "lessor_barangay" : "lessor_barangay",
  "lessor_str" : "lessor_str",
  "no_units" : "no_units",
  "monthly_rental" : "monthly_rental",
  "business_activity" : "business_activity",
  "lessor_emailaddr" : "lessor_emailaddr",
  "expiration_date" : "expiration_date",
  "ctc_no" : "ctc_no",
  "lessors_name" : "lessors_name",
  "lessor_city" : "lessor_city",
  "lessor_province" : "lessor_province",
  "capitalization" : "capitalization",
  "permit_id" : "permit_id",
  "user_id" : "user_id",
  "date_approval" : "date_approval",
  "lessor_subdv" : "lessor_subdv",
  "attachment_id" : "attachment_id",
  "lessor_bldg_no" : "lessor_bldg_no"
}}]
     
     - parameter permitId: (path)  

     - returns: RequestBuilder<BarangayPermitModel> 
     */
    open class func permitPermitIdGetWithRequestBuilder(permitId: String) -> RequestBuilder<BarangayPermitModel> {
        var path = "/permit/{permit_id}"
        let permitIdPreEscape = "\(permitId)"
        let permitIdPostEscape = permitIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{permit_id}", with: permitIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayPermitModel>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter barangayPermitModel: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func permitPost(barangayPermitModel: BarangayPermitModel, completion: @escaping ((_ data: Empty?,_ error: Error?) -> Void)) {
        permitPostWithRequestBuilder(barangayPermitModel: barangayPermitModel).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /permit
     - examples: [{contentType=application/json, example={ }}]
     
     - parameter barangayPermitModel: (body)  

     - returns: RequestBuilder<Empty> 
     */
    open class func permitPostWithRequestBuilder(barangayPermitModel: BarangayPermitModel) -> RequestBuilder<Empty> {
        let path = "/permit"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: barangayPermitModel)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Empty>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func userGet(completion: @escaping ((_ data: BarangayUserArray?,_ error: Error?) -> Void)) {
        userGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /user
     - examples: [{contentType=application/json, example=""}]

     - returns: RequestBuilder<BarangayUserArray> 
     */
    open class func userGetWithRequestBuilder() -> RequestBuilder<BarangayUserArray> {
        let path = "/user"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayUserArray>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter barangayUserModel: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func userPost(barangayUserModel: BarangayUserModel, completion: @escaping ((_ data: Empty?,_ error: Error?) -> Void)) {
        userPostWithRequestBuilder(barangayUserModel: barangayUserModel).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /user
     - examples: [{contentType=application/json, example={ }}]
     
     - parameter barangayUserModel: (body)  

     - returns: RequestBuilder<Empty> 
     */
    open class func userPostWithRequestBuilder(barangayUserModel: BarangayUserModel) -> RequestBuilder<Empty> {
        let path = "/user"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: barangayUserModel)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Empty>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter userId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func userUserIdGet(userId: String, completion: @escaping ((_ data: BarangayUserModel?,_ error: Error?) -> Void)) {
        userUserIdGetWithRequestBuilder(userId: userId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /user/{user_id}
     - examples: [{contentType=application/json, example={
  "profession" : "profession",
  "firstname" : "firstname",
  "address" : "address",
  "mobilenumber" : "mobilenumber",
  "gross_income" : "gross_income",
  "createdate" : "createdate",
  "weight" : "weight",
  "tin_no" : "tin_no",
  "birtdate" : "birtdate",
  "ctc_no" : "ctc_no",
  "lastname" : "lastname",
  "zipcode" : "zipcode",
  "place_of_birth" : "place_of_birth",
  "password" : "password",
  "user_id" : "user_id",
  "civil_status" : "civil_status",
  "contact_no" : "contact_no",
  "attachment_id" : "attachment_id",
  "control_no" : "control_no",
  "username" : "username",
  "height" : "height"
}}]
     
     - parameter userId: (path)  

     - returns: RequestBuilder<BarangayUserModel> 
     */
    open class func userUserIdGetWithRequestBuilder(userId: String) -> RequestBuilder<BarangayUserModel> {
        var path = "/user/{user_id}"
        let userIdPreEscape = "\(userId)"
        let userIdPostEscape = userIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{user_id}", with: userIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<BarangayUserModel>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}