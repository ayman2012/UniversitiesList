//
//  UniversitiesListInteractorTests.swift
//  UniversitiesListTests
//
//  Created by Ayman Fathy on 05/05/2024.
//

import XCTest
@testable import UniversitiesList

final class UniversitiesListInteractorTests: XCTestCase {
    
    class MockedUniversitiesListInteractorOutput: UniversitiesListInteractorOutputProtocol {
        var expectation: XCTestExpectation?
        var currentError: String?

        func fetchUniversitiesListSuccess(universitiesList: [UniversitiesListResponseDataModel]) {
            expectation?.fulfill()
            XCTAssertEqual(universitiesList.count, 37) // Mocked universitiesList count = 37
        }
        
        func fetchUniversitiesListFailure(error: String) {
            expectation?.fulfill()
            XCTAssertEqual(currentError!, error)
        }
    }
    
    var interactor: UniversitiesListInteractor!
    var output: MockedUniversitiesListInteractorOutput!
    
    override func setUpWithError() throws {
        interactor = UniversitiesListInteractor.init(repo: MockedUniversitiesListAPI(), cacheManager: MockedCacheManager())
        output = MockedUniversitiesListInteractorOutput()
    }

    override func tearDownWithError() throws {
        interactor = nil
    }
    
    func test_getUniversitiesList() {
        // Given
        let unlockExpectation = expectation(description: "delegate is called")
        output.expectation = unlockExpectation
        interactor.output = output
        // When
        interactor.fetchData()
        
        // Then
        wait(for: [unlockExpectation], timeout: 20)
    }
}

