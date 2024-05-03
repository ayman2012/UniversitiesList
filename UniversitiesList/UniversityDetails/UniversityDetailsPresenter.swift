//
//  UniversityDetailsPresenter.swift
//  UniversitiesList
//
//  Created by Ayman Fathy on 02/05/2024.
//

import Foundation
class UniversityDetailsPresenter: UniversityDetailsPresenterProtocol {
    
    weak var view: UniversityDetailsViewProtocol?
    var interactor: UniversityDetailsInteractorInputProtocol
    var router: UniversityDetailsRouterProtocol
    private var universityDetails: UniversitiesDetailsUIModel?
    
    init(interactor: UniversityDetailsInteractorInputProtocol, router: UniversityDetailsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        universityDetails = interactor.getUniversityDetails()
        view?.updateUI()
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
