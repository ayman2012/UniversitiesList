//
//  UniversitiesListContracts.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 01/05/2024.
//

import Foundation
import UIKit

// View protocol
protocol UniversitiesListViewProtocol: AnyObject {
    var presenter: UniversitiesListPresenterProtocol { get set }
    
    func onFetchUniversitiesListSuccess()
    func onFetchUniversitiesListFailure(error: String)
    func showLoader()
    func hideLoader()
}

// Presenter protocol
protocol UniversitiesListPresenterProtocol: AnyObject {
    var router: UniversitiesListRouterProtocol { get set }
    var interactor: UniversitiesListInteractorInputProtocol { get set }
    var view: UniversitiesListViewProtocol? { get set }
    
    func viewDidLoad()
    func refresh()
    
    
    func getNumberOfUniversitiesList() -> Int
    func getUniversityModelFor(index: Int) -> UniversityUIModel?
    func getUniversityDetailsFor(index: Int) -> UniversitiesListResponseDataModel?
}

// Interactor Input protocol
protocol UniversitiesListInteractorInputProtocol: AnyObject {
    var output: UniversitiesListInteractorOutputProtocol? { get set }    
    func fetchData()
}

// Interactor Output protocol
protocol UniversitiesListInteractorOutputProtocol: AnyObject {
    func fetchUniversitiesListSuccess(universitiesList: [UniversitiesListResponseDataModel])
    func fetchUniversitiesListFailure(error: String)
}


// Router protocol
protocol UniversitiesListRouterProtocol: AnyObject {
    var viewController: UniversitiesListViewController? { get set }
    func createModule() -> UINavigationController?
    func pushToUniversityDetails(on view: UniversitiesListViewProtocol?, with University: String)
}
