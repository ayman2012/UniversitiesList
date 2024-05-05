//
//  UniversitiesListPresenterTests.swift
//  UniversitiesListTests
//
//  Created by Ayman Fathy on 05/05/2024.
//

import XCTest
@testable import UniversitiesList

final class UniversitiesListPresenterTests: XCTestCase {
    var presenter: UniversitiesListPresenterProtocol!
    var view: MockedUniversitiesListView!
    var interactor: MockedUniversitiesListInteractorInput!
    var router: MockedUniversitiesListRouter!
    var output: MockedUniversitiesListInteractorOutput!
    override func setUpWithError() throws {
        interactor = MockedUniversitiesListInteractorInput()
        router = MockedUniversitiesListRouter()
        presenter = UniversitiesListPresenter.init(interactor: interactor, router: router)
        output = MockedUniversitiesListInteractorOutput()
        interactor.output = output
        view = MockedUniversitiesListView(presenter: presenter)
        presenter.view = view
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        view = nil
        interactor = nil
        router = nil
    }
    
    func test_getEmptyDataList() {
        // Given
        let unlockExpectation = expectation(description: "delegate is called")
        output.expectation = unlockExpectation
        
        // When
        presenter.viewDidLoad()

        // Then
        wait(for: [unlockExpectation], timeout: 20)
    }
}

class MockedUniversitiesListInteractorInput: UniversitiesListInteractorInputProtocol {
    var output: UniversitiesListInteractorOutputProtocol?
    func fetchData() {
        output?.fetchUniversitiesListSuccess(universitiesList: [])
    }
}

class MockedUniversitiesListInteractorOutput: UniversitiesListInteractorOutputProtocol {
    var expectation: XCTestExpectation?
    
    func fetchUniversitiesListSuccess(universitiesList: [UniversitiesListResponseDataModel]) {
        XCTAssertEqual(universitiesList.count, 0)
        expectation?.fulfill()
    }
    
    func fetchUniversitiesListFailure(error: String) {
        
    }
}

class MockedUniversitiesListRouter: UniversitiesListRouterProtocol {
    func createModule() -> UINavigationController? {
        return UINavigationController.init(rootViewController: UIViewController())
    }
    
    func pushToUniversityDetails(on view: UniversitiesListViewProtocol?, with universityDataModel: UniversitiesListResponseDataModel?, refreshDelegate: UniversitiesList.RefreshDelegateProtocol) {
        
    }
}


class MockedUniversitiesListView: UniversitiesListViewProtocol {
    
    var presenter: UniversitiesList.UniversitiesListPresenterProtocol
    
    init(presenter: UniversitiesList.UniversitiesListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func onFetchUniversitiesListSuccess() {
    }
    
    func onFetchUniversitiesListFailure(error: String) {
        
    }
    
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
}
