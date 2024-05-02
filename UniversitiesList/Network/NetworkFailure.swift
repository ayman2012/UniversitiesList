//
//  NetworkFailure.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation

enum NetworkFailure: LocalizedError {
    case generalFailure, failedToParseData, connectionFailed
    var errorDescription: String? {
        switch self {
        case .failedToParseData:
            return "Technical Difficulties, we can't fetch the data"
        default:
            return "Check your connectivity"
        }
    }
}
