//
//  UniversitiesListPresenter.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation

class UniversitiesListPresenter: UniversitiesListPresenterProtocol {    
    weak var view: UniversitiesListViewProtocol?
    var interactor: UniversitiesListInteractorInputProtocol
    var router: UniversitiesListRouterProtocol
    
    init(interactor: UniversitiesListInteractorInputProtocol, router: UniversitiesListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    private var universitiesList = [UniversitiesListResponseDataModel]()
    
    func viewDidLoad() {
        view?.showLoader()
        interactor.fetchData()
    }
    
    func refresh() {
        
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
    
    private func mapUniversityDataModelToUIModel(model: UniversitiesListResponseDataModel?) -> UniversityUIModel? {
        guard let model = model else { return nil}
        return UniversityUIModel.init(name: model.name, state: model.stateProvince)
    }
}

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
extension UniversitiesListPresenter: RefreshDelegateProtocol {
    func refreshData() {
        view?.showLoader()
        interactor.fetchData()
    }
}

