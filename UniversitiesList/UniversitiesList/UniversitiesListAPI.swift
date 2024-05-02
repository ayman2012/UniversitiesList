//
//  UniversitiesListAPI.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
import Alamofire

enum UniversitiesListAPI {
    case getUniversitiesList
}

extension UniversitiesListAPI: RequestBuilder {
    var path: String {
        switch self {
        case .getUniversitiesList:
            return "search"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getUniversitiesList:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getUniversitiesList:
            return ["country": "United Arab Emirates"]
        }
    }
}
