//
// BarangayPermitModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct BarangayPermitModel: Codable {

    public var permitId: String?
    public var attachmentId: String?
    public var businessActivity: String?
    public var businessName: String?
    public var capitalization: String?
    public var ctcNo: String?
    public var dateApproval: String?
    public var expirationDate: String?
    public var grossSale: String?
    public var lessorBarangay: String?
    public var lessorBldgNo: String?
    public var lessorCity: String?
    public var lessorEmailaddr: String?
    public var lessorProvince: String?
    public var lessorStr: String?
    public var lessorSubdv: String?
    public var lessorsName: String?
    public var monthlyRental: String?
    public var noUnits: String?
    public var userId: String?

    public init(permitId: String?, attachmentId: String?, businessActivity: String?, businessName: String?, capitalization: String?, ctcNo: String?, dateApproval: String?, expirationDate: String?, grossSale: String?, lessorBarangay: String?, lessorBldgNo: String?, lessorCity: String?, lessorEmailaddr: String?, lessorProvince: String?, lessorStr: String?, lessorSubdv: String?, lessorsName: String?, monthlyRental: String?, noUnits: String?, userId: String?) {
        self.permitId = permitId
        self.attachmentId = attachmentId
        self.businessActivity = businessActivity
        self.businessName = businessName
        self.capitalization = capitalization
        self.ctcNo = ctcNo
        self.dateApproval = dateApproval
        self.expirationDate = expirationDate
        self.grossSale = grossSale
        self.lessorBarangay = lessorBarangay
        self.lessorBldgNo = lessorBldgNo
        self.lessorCity = lessorCity
        self.lessorEmailaddr = lessorEmailaddr
        self.lessorProvince = lessorProvince
        self.lessorStr = lessorStr
        self.lessorSubdv = lessorSubdv
        self.lessorsName = lessorsName
        self.monthlyRental = monthlyRental
        self.noUnits = noUnits
        self.userId = userId
    }

    public enum CodingKeys: String, CodingKey { 
        case permitId = "permit_id"
        case attachmentId = "attachment_id"
        case businessActivity = "business_activity"
        case businessName = "business_name"
        case capitalization
        case ctcNo = "ctc_no"
        case dateApproval = "date_approval"
        case expirationDate = "expiration_date"
        case grossSale = "gross_sale"
        case lessorBarangay = "lessor_barangay"
        case lessorBldgNo = "lessor_bldg_no"
        case lessorCity = "lessor_city"
        case lessorEmailaddr = "lessor_emailaddr"
        case lessorProvince = "lessor_province"
        case lessorStr = "lessor_str"
        case lessorSubdv = "lessor_subdv"
        case lessorsName = "lessors_name"
        case monthlyRental = "monthly_rental"
        case noUnits = "no_units"
        case userId = "user_id"
    }


}
