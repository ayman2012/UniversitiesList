//
//  MockedCacheManager.swift
//  UniversitiesListTests
//
//  Created by Ayman Fathy on 05/05/2024.
//

import Foundation
@testable import UniversitiesList
import Realm

class MockedCacheManager: CacheManagerProtocol {
    var savedList: [AnyObject] = []
    
    func writeDataList<T>(dataObjects: [T]) -> Bool where T : RealmSwiftObject {
        savedList = dataObjects
        return true
    }
    
    func getDataList<T>() -> [T]? where T : RealmSwiftObject {
        return (savedList as? [T]) ?? []
    }
}
