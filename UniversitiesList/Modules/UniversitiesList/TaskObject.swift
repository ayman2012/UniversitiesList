//
//  TaskObject.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 04/05/2024.
//

import Foundation
import RealmSwift

class TaskObject: Object {
    @Persisted var universityName: String
    @Persisted var universityCountry: String
    @Persisted var universityCountryCode: String
    @Persisted var universityState: String
    @Persisted var universityWebPage: String
    
    convenience init(universityName: String,
                     universityCountry: String,
                     universityCountryCode: String,
                     universityState: String,
                     universityWebPage: String) {
        self.init()
        self.universityName = universityName
        self.universityCountry = universityCountry
        self.universityCountryCode = universityCountryCode
        self.universityState = universityState
        self.universityWebPage = universityWebPage
    }
}
