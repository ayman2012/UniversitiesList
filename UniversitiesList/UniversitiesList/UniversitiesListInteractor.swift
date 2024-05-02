//
//  UniversitiesListInteractor.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
class UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    weak var output: UniversitiesListInteractorOutputProtocol?
    var repo: NetworkManagerProtocol
    private var universitiesList = [UniversitiesListResponseDataModel]()
    
    init(repo: NetworkManagerProtocol) {
        self.repo = repo
    }
    
    func fetchData() {
        repo.sendRequest(endPoint: UniversitiesListAPI.getUniversitiesList,
                         decodingType: UniversitiesListResponseModel.self) { [weak self] response in
            
            guard let self = self else { return }
            switch response {
            case .success(let model):
                output?.fetchUniversitiesListSuccess(universitiesList: model)
            case .failure(let error):
                output?.fetchUniversitiesListFailure(error: error.localizedDescription ?? "- -")
            }
        }
    }
}
