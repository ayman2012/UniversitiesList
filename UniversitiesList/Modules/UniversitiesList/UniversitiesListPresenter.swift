//
//  UniversitiesListPresenter.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation

// MARK: - UniversitiesListPresenter Class
class UniversitiesListPresenter {
    
    // MARK: - Properties
    weak var view: UniversitiesListViewProtocol?
    var interactor: UniversitiesListInteractorInputProtocol
    var router: UniversitiesListRouterProtocol
    private var universitiesList = [UniversitiesListResponseDataModel]()
    
    // MARK: - Initialization
    init(interactor: UniversitiesListInteractorInputProtocol, router: UniversitiesListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Utilities Methods
    private func mapUniversityDataModelToUIModel(model: UniversitiesListResponseDataModel?) -> UniversityUIModel? {
        guard let model = model else { return nil}
        return UniversityUIModel.init(name: model.name, state: model.stateProvince)
    }
}

// MARK: - UniversitiesListPresenterProtocol Extension
extension UniversitiesListPresenter: UniversitiesListPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoader()
        interactor.fetchData()
    }
    
    func getNumberOfUniversitiesList() -> Int {
        return universitiesList.count
    }
    
    func getUniversityModelFor(index: Int) -> UniversityUIModel? {
        return mapUniversityDataModelToUIModel(model: universitiesList[safe: index])
    }
    
    func getUniversityDetailsFor(index: Int) -> UniversitiesListResponseDataModel? {
        universitiesList[index]
    }
    
    func navigateToDetailsViewFor(index: Int) {
        router.pushToUniversityDetails(on: view, with: universitiesList[safe: index], refreshDelegate: self)
    }
}

// MARK: - UniversitiesListInteractorOutputProtocol Extension
extension UniversitiesListPresenter: UniversitiesListInteractorOutputProtocol {
    func fetchUniversitiesListSuccess(universitiesList: [UniversitiesListResponseDataModel]) {
        self.universitiesList = universitiesList
        view?.hideLoader()
        view?.onFetchUniversitiesListSuccess()
    }
    
    func fetchUniversitiesListFailure(error: String) {
        view?.hideLoader()
        view?.onFetchUniversitiesListFailure(error: error)
    }
}

// MARK: - RefreshDelegateProtocol Extension
extension UniversitiesListPresenter: RefreshDelegateProtocol {
    func refreshData() {
        view?.showLoader()
        interactor.fetchData()
    }
}

