//
//  UniversitiesListRouter.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
import UIKit

class UniversitiesListRouter: UniversitiesListRouterProtocol {
   weak var viewController: UniversitiesListViewController?
    
    func createModule() -> UINavigationController? {
        let router = UniversitiesListRouter()
        let repo = NetworkManager()
        let interactor = UniversitiesListInteractor(repo: repo)
        let presenter = UniversitiesListPresenter(interactor: interactor, router: router)
        let universitiesListViewController = UniversitiesListViewController(presenter: presenter)
        presenter.view = universitiesListViewController
        router.viewController = universitiesListViewController
        interactor.output = presenter
        return UINavigationController(rootViewController: universitiesListViewController)
    }
    
    func pushToUniversityDetails(on view: UniversitiesListViewProtocol?, with University: String) {
        
    }
}

