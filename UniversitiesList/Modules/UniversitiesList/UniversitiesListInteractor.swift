//
//  UniversitiesListInteractor.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation

// MARK: - UniversitiesListInteractor Class
class UniversitiesListInteractor {
    
    // MARK: - Properties
    let repo: NetworkManagerProtocol
    let cacheManager: CacheManagerProtocol
    weak var output: UniversitiesListInteractorOutputProtocol?
    private var universitiesList = [UniversitiesListResponseDataModel]()
    
    // MARK: - Initialization
    init(repo: NetworkManagerProtocol, cacheManager: CacheManagerProtocol) {
        self.repo = repo
        self.cacheManager = cacheManager
    }
    
    // MARK: - Utilities Methods
    private func funcHandleNetworkFailure(error: Error) {
        let localData: [UniversitiesListResponseDataModel]? = getCachedData()?.map({
          UniversitiesListResponseDataModel.init(domains: [$0.universityWebPage],
                                                 stateProvince: $0.universityState,
                                                 name: $0.universityName,
                                                 webPages: [$0.universityWebPage],
                                                 country: $0.universityCountry,
                                                 alphaTwoCode: $0.universityCountryCode)
        })
        if localData == nil {
            // TODO: - Apply localization for english text
            output?.fetchUniversitiesListFailure(error: "Technical Difficulties, we can't fetch the data")
        } else {
            output?.fetchUniversitiesListSuccess(universitiesList: localData ?? [])
        }
    }
    
    private func saveUniversitiesListData(universitiesListCachedModel: [TaskObject]) {
        let isWriteDataListSucceeded = cacheManager.writeDataList(dataObjects: universitiesListCachedModel)
       if !isWriteDataListSucceeded {
           // TODO: - Apply localization for english text
            output?.fetchUniversitiesListFailure(error: "Failed to cache data offline")
        }
    }
    
    private func getCachedData() -> [TaskObject]? {
        let list:[TaskObject]? = cacheManager.getDataList()
        return list
    }
    
    private func mapUniversitiesListModelToObjectModel(universitiesList: UniversitiesListResponseModel) -> [TaskObject] {
        universitiesList.map({TaskObject.init(universityName: $0.name, universityCountry: $0.country, universityCountryCode: $0.alphaTwoCode, universityState: $0.stateProvince ?? "", universityWebPage: $0.webPages.first ?? "")})
    }
}

// MARK: - UniversitiesListInteractorInputProtocol Extension
extension UniversitiesListInteractor: UniversitiesListInteractorInputProtocol {
    func fetchData() {
        repo.sendRequest(endPoint: UniversitiesListAPI.getUniversitiesList,
                         decodingType: UniversitiesListResponseModel.self) { [weak self] response in
            
            guard let self = self else { return }
            switch response {
            case .success(let model):
                output?.fetchUniversitiesListSuccess(universitiesList: model)
                let cachedDate = mapUniversitiesListModelToObjectModel(universitiesList: model)
                saveUniversitiesListData(universitiesListCachedModel: cachedDate)
            case .failure(let error):
                funcHandleNetworkFailure(error: error)
            }
        }
    }
}
