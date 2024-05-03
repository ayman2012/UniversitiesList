//
//  UniversityDetailsInteractor.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
class UniversityDetailsInteractor: UniversityDetailsInteractorInputProtocol {
    private let universityDetails: UniversitiesListResponseDataModel
    
    init(universityDetails: UniversitiesListResponseDataModel) {
        self.universityDetails = universityDetails
    }
    
    func getUniversityDetails() -> UniversitiesDetailsUIModel {
        return mapUniversityDetailsDataModelToUIModel(model: universityDetails)
    }
    
    private func mapUniversityDetailsDataModelToUIModel(model: UniversitiesListResponseDataModel) -> UniversitiesDetailsUIModel {
        UniversitiesDetailsUIModel.init(name: model.name,
                                        state: model.stateProvince,
                                        country: model.country,
                                        countryCode: model.alphaTwoCode,
                                        webPage: model.webPages.first)
    }
}
