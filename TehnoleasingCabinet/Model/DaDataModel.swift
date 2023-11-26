//
//  DaDataModel.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 26.11.2023.
//

import Foundation

// MARK: - Welcome
struct DaDataStruct: Codable {
    let suggestions: [Suggestion]
}
// MARK: - Suggestion
struct Suggestion: Codable {
    let value, unrestrictedValue: String
    let data: SuggestionData

    enum CodingKeys: String, CodingKey {
        case value
        case unrestrictedValue = "unrestricted_value"
        case data
    }
}
// MARK: - SuggestionData
struct SuggestionData: Codable {
    let kpp: String
    let branchCount: Int
    let state: State
    let inn, ogrn: String
    let okpo: String?
    let address: Address

    enum CodingKeys: String, CodingKey {
        case kpp
        case branchCount = "branch_count"
        case state, inn, ogrn, okpo, address
    }
}
// MARK: - Address
struct Address: Codable {
    let value, unrestrictedValue: String
    enum CodingKeys: String, CodingKey {
        case value
        case unrestrictedValue = "unrestricted_value"
    }
}
// MARK: - State
struct State: Codable {
    let code: String?
    let actualityDate, registrationDate: Int
    let liquidationDate: Int?

    enum CodingKeys: String, CodingKey {
        case code
        case actualityDate = "actuality_date"
        case registrationDate = "registration_date"
        case liquidationDate = "liquidation_date"
    }
}
