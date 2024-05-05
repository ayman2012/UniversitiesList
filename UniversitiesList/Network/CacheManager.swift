//
//  CacheManager.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 04/05/2024.
//

import Foundation
import RealmSwift

protocol CacheManagerProtocol {
    func writeDataList<T: Object>(dataObjects: [T]) -> Bool
    func getDataList<T: Object>() -> [T]?
}

class CacheManager: CacheManagerProtocol {
    
    func writeDataList<T: Object>(dataObjects: [T]) -> Bool {
         let realm = try? Realm()
        do {
            try realm?.write {
                realm?.deleteAll()
                for object in dataObjects {
                    realm?.add(object)
                }
            }
            return true
        } catch {
            return false
        }
    }
    
    func getDataList<T: Object>() -> [T]? {
        let realm = try? Realm()
        guard let taskObjectList = realm?.objects(T.self) else { return nil}
        return Array(taskObjectList)
    }
}

