//
//  UniversityDetailsRouter.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
import UIKit

class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    
    func buildUniversityDetailsModule(universityDataModel: UniversitiesListResponseDataModel) -> UIViewController {
        let router = UniversityDetailsRouter()
        let interactor = UniversityDetailsInteractor(universityDetails: universityDataModel)
        let presenter = UniversityDetailsPresenter(interactor: interactor, router: router)
        let viewController = UniversityDetailsViewController(presenter: presenter)
        
        presenter.view = viewController
        
        return viewController
    }
}
