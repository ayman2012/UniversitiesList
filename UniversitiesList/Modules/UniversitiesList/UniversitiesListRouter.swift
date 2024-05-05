//
//  UniversitiesListRouter.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
import UIKit

// MARK: - UniversitiesListRouter Class
class UniversitiesListRouter: UniversitiesListRouterProtocol {
    
    func createModule() -> UINavigationController? {
        let router = UniversitiesListRouter()
        let repo = NetworkManager()
        let cacheManager = CacheManager()
        let interactor = UniversitiesListInteractor(repo: repo, cacheManager: cacheManager)
        let presenter = UniversitiesListPresenter(interactor: interactor, router: router)
        let universitiesListViewController = UniversitiesListViewController(presenter: presenter)
        presenter.view = universitiesListViewController
        interactor.output = presenter
        return UINavigationController(rootViewController: universitiesListViewController)
    }
    
    func pushToUniversityDetails(on view: UniversitiesListViewProtocol?, with universityDataModel: UniversitiesListResponseDataModel?, refreshDelegate: RefreshDelegateProtocol) {
        guard let model = universityDataModel else { return }
        let detailsViewController = UniversityDetailsRouter().buildUniversityDetailsModule(universityDataModel: model, refreshDelegate: refreshDelegate)
        guard let viewController = view as? UniversitiesListViewController else { return }
        viewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

