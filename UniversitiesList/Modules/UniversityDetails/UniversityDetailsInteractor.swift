//
//  UniversityDetailsInteractor.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation

// MARK: - UniversityDetailsInteractor Class
class UniversityDetailsInteractor {
    
    // MARK: - Properties
    private let universityDetails: UniversitiesListResponseDataModel
    
    // MARK: - Initialization
    init(universityDetails: UniversitiesListResponseDataModel) {
        self.universityDetails = universityDetails
    }
    
    // MARK: - Utilities Methods
    private func mapUniversityDetailsDataModelToUIModel(model: UniversitiesListResponseDataModel) -> UniversitiesDetailsUIModel {
        UniversitiesDetailsUIModel.init(name: model.name,
                                        state: model.stateProvince,
                                        country: model.country,
                                        countryCode: model.alphaTwoCode,
                                        webPage: model.webPages.first)
    }
}

// MARK: - UniversityDetailsInteractorInputProtocol Extension
extension UniversityDetailsInteractor: UniversityDetailsInteractorInputProtocol {
    
    func getUniversityDetails() -> UniversitiesDetailsUIModel {
        return mapUniversityDetailsDataModelToUIModel(model: universityDetails)
    }
}
