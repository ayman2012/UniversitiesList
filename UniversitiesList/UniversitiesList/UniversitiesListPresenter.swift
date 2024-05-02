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
        guard index < universitiesList.count else { return nil}
       return mapUniversityDataModelToUIModel(model: universitiesList[index])
    }
    
    func getUniversityDetailsFor(index: Int) -> UniversitiesListResponseDataModel? {
        universitiesList[index]
    }
    
    private func mapUniversityDataModelToUIModel(model: UniversitiesListResponseDataModel) -> UniversityUIModel? {
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
