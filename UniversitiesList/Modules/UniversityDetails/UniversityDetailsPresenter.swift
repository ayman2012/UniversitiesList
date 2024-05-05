//
//  UniversityDetailsPresenter.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation

// MARK: - UniversityDetailsPresenter Class
class UniversityDetailsPresenter {
    
    // MARK: - Properties 
    var interactor: UniversityDetailsInteractorInputProtocol
    var router: UniversityDetailsRouterProtocol
    weak var view: UniversityDetailsViewProtocol?
    weak var refreshDelegate: RefreshDelegateProtocol?
    private var universityDetails: UniversitiesDetailsUIModel?
    
    // MARK: - Initialization
    init(interactor: UniversityDetailsInteractorInputProtocol, router: UniversityDetailsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - UniversityDetailsPresenterProtocol Extension
extension UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    
    func viewDidLoad() {
        universityDetails = interactor.getUniversityDetails()
        view?.updateUI()
    }
    
    func refreshData() {
        router.dismissUniversityDetails(view: view)
        refreshDelegate?.refreshData()
    }
    
    func getUniversityName() -> String  {
        return universityDetails?.name ?? "- -"
    }
    
    func getUniversityState() -> String  {
        return universityDetails?.state ?? "- -"
    }
    
    func getUniversityCountry() -> String {
        return universityDetails?.country ?? "- -"
    }
    
    func getUniversityCountryCode() -> String {
        return universityDetails?.countryCode ?? "- -"
    }
    
    func getUniversityWebPage() -> String {
        return universityDetails?.webPage ?? "- -"
    }
}
