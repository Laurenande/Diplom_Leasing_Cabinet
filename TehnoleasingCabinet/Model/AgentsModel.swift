//
//  AgentsModel.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.12.2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - Welcome
struct Agents: Codable {
    let id, phone, password, surname: String
    let email: String
    let enterCode: String?
    let enterCodeTimer, amountCodes, amountCodesTimer, emailVerifiedAt: String?
    let emailConfirmed, contractStatus: Bool
    let contractCode: String?
    let contractCodeTimer, pinned, wasPinned, rememberToken: String?
    let createdAt, updatedAt: String?
    let contractConclusion: Bool
    let emailVerifiedCode, notificationsEmailStatus, notificationsSMSStatus: String?
    let status: String
    let temporaryEmail: String?
    enum CodingKeys: String, CodingKey {
        case id, phone, password, surname, email
        case enterCode = "enter_code"
        case enterCodeTimer = "enter_code_timer"
        case amountCodes = "amount_codes"
        case amountCodesTimer = "amount_codes_timer"
        case emailVerifiedAt = "email_verified_at"
        case emailConfirmed = "email_confirmed"
        case contractStatus = "contract_status"
        case contractCode = "contract_code"
        case contractCodeTimer = "contract_code_timer"
        case pinned
        case wasPinned = "was_pinned"
        case rememberToken = "remember_token"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case contractConclusion = "contract_conclusion"
        case emailVerifiedCode = "email_verified_code"
        case notificationsEmailStatus = "notifications_email_status"
        case notificationsSMSStatus = "notifications_sms_status"
        case status
        case temporaryEmail = "temporary_email"
    
    }
}
