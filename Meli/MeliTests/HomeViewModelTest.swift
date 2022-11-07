//
//  HomeViewModelTest.swift
//  MeliTests
//
//  Created by Jhonnatan Macias on 7/11/22.
//

import XCTest
@testable import Meli

class HomeViewModelTest: XCTestCase {

    var mockViewModel: MockViewModel!
    var mockDataSource: MockServices!

    override func setUp() {
        super.setUp()

        mockDataSource = MockServices()
        mockViewModel = MockViewModel(dataSource: MockServices())
    }

    override func tearDown() {

        mockViewModel = nil
        mockDataSource = nil

        super.tearDown()
    }

    func testLoadItems() throws {
        XCTAssertNotNil(mockDataSource)
        XCTAssertNotNil(mockViewModel)

        mockViewModel.dataSource.getItems(itemTitle: "iphone") { response in

            do {
                let items = try response.get()
                XCTAssertEqual(items.items.count, 1)
                XCTAssertTrue(self.mockViewModel.dataSource.getItemCalled)

            } catch {
                XCTFail(error.localizedDescription)
            }
        }
    }

}
