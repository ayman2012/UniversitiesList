//
//  UniversityDetailsContracts.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
import UIKit

protocol UniversityDetailsViewProtocol: AnyObject {
    var presenter: UniversityDetailsPresenterProtocol { get set }
    func updateUI()
    func dismissUniversityDetails()
}

protocol UniversityDetailsPresenterProtocol: AnyObject {
    var view: UniversityDetailsViewProtocol? {get set}
    var interactor: UniversityDetailsInteractorInputProtocol {get set}
    var router: UniversityDetailsRouterProtocol {get set}
    
    func viewDidLoad()
    func refreshData()
    func getUniversityName() -> String
    func getUniversityState() -> String
    func getUniversityCountry() -> String
    func getUniversityCountryCode() -> String
    func getUniversityWebPage() -> String
}

protocol UniversityDetailsInteractorInputProtocol: AnyObject {
    func getUniversityDetails() -> UniversitiesDetailsUIModel
}

protocol UniversityDetailsRouterProtocol: AnyObject {
    func buildUniversityDetailsModule(universityDataModel: UniversitiesListResponseDataModel, refreshDelegate: RefreshDelegateProtocol) -> UIViewController
    func dismissUniversityDetails(view: UniversityDetailsViewProtocol?)
}
