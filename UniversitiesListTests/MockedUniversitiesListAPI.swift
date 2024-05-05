//
//  MockedUniversitiesListAPI.swift
//  UniversitiesListTests
//
//  Created by Ayman Fathy on 05/05/2024.
//

import Foundation
@testable import UniversitiesList

class MockedUniversitiesListAPI: NetworkManagerProtocol {
    func sendRequest<ResponseType>(endPoint: RequestBuilder,
                                   decodingType: ResponseType.Type,
                                   completion: @escaping (Result<ResponseType, Error>) -> Void) where ResponseType: Decodable {
        guard let data = TestHelper().loadStubDataFromBundle(name: "UniversitiesListMockedJson", extension: "json"),
              let model: ResponseType =  try? JSONDecoder().decode(decodingType.self, from: data) else {
            completion(.failure(NetworkFailure.generalFailure))
            return
        }
        completion(.success(model))
    }
}
