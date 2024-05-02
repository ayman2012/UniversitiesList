//
//  UniversitiesListResponseModel.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
typealias UniversitiesListResponseModel = [UniversitiesListResponseDataModel]

// MARK: - UniversitiesListResponseModelElement
struct UniversitiesListResponseDataModel: Codable {
    let domains: [String]
    let stateProvince: String?
    let name: String
    let webPages: [String]
    let country: String
    let alphaTwoCode: String

    enum CodingKeys: String, CodingKey {
        case domains
        case stateProvince = "state-province"
        case name
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
}

