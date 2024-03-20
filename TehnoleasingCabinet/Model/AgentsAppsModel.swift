//
//  AgentsAppsModel.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 19.03.2024.
//

import Foundation

struct Apps: Codable {
    let id, phone, appNum, appGroup: String
    let appType, appName, appAdvance: String
    let appTerm: String?
    let appCompany, appCost, appComission, appContactName: String
    let appContactPhone, appGuarantor, appNote, appE: String
    let appUsed: String
    let appBalance, appCommercial: String?
    let tariffRate, appStatus: String
    let payAccrualDate: String?
    let payStatus, payMentDate, createdAt: String
    let updatedAt: String?
    let appReturnable, pinned: String
    let pinnedAdditional, appAdditionalDocument, appPublicProcurement: String?
    let appFormat: String
    let appCustomBody, email: String?

    enum CodingKeys: String, CodingKey {
        case id, phone
        case appNum = "app_num"
        case appGroup = "app_group"
        case appType = "app_type"
        case appName = "app_name"
        case appAdvance = "app_advance"
        case appTerm = "app_term"
        case appCompany = "app_company"
        case appCost = "app_cost"
        case appComission = "app_comission"
        case appContactName = "app_contact_name"
        case appContactPhone = "app_contact_phone"
        case appGuarantor = "app_guarantor"
        case appNote = "app_note"
        case appE = "app_e"
        case appUsed = "app_used"
        case appBalance = "app_balance"
        case appCommercial = "app_commercial"
        case tariffRate = "tariff_rate"
        case appStatus = "app_status"
        case payAccrualDate = "pay_accrual_date"
        case payStatus = "pay_status"
        case payMentDate = "pay_ment_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case appReturnable = "app_returnable"
        case pinned
        case pinnedAdditional = "pinned_additional"
        case appAdditionalDocument = "app_additional_document"
        case appPublicProcurement = "app_public_procurement"
        case appFormat = "app_format"
        case appCustomBody = "app_custom_body"
        case email
    }
}
