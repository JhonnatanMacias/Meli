//
//  MeliTests.swift
//  MeliTests
//
//  Created by Jhonnatan Macias on 31/10/22.
//

import XCTest
@testable import Meli

class MeliTests: XCTestCase {

    var viewController: ViewController!
    var mockViewModel: MockViewModel!
    var mockWindow: UIWindow!

    override func setUp() {
        super.setUp()

        mockWindow = MockWindow()
        mockViewModel = MockViewModel(dataSource: MockServices())
        viewController = ViewController()
        viewController.viewModel = mockViewModel
    }

    override func tearDown() {

        viewController = nil
        super.tearDown()
    }

    /// Force loads the view controller to a "viewDidAppear" state.
    func loadViewController() throws {
        let navigationController = UINavigationController(rootViewController: viewController)
        _ = MockWindow(rootViewController: navigationController)
        _ = viewController.view
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        viewController.viewWillAppear(true)
    }

    func testRequiredField() throws {
        try loadViewController()

        XCTAssertTrue(viewController.view.subviews.contains(
            viewController.testHooks.tableView))

        XCTAssertEqual(viewController.testHooks.tableView.numberOfSections, 1)
        XCTAssertNotNil(viewController.testHooks.tableView.dataSource)
        XCTAssertNotNil(viewController.navigationController)
        XCTAssertEqual(viewController.testHooks.tableView.numberOfRows(inSection: 0), 1)
    }

    func testLoadItem() throws {
        try loadViewController()

        XCTAssertFalse(mockViewModel.dataSource.getItemCalled)
        XCTAssertFalse(mockViewModel.getItemCalled)

        // When
        mockViewModel.getItems(itemTitle: "iphone")

        XCTAssertTrue(mockViewModel.dataSource.getItemCalled)
        XCTAssertTrue(mockViewModel.getItemCalled)

        mockViewModel.dataSource.getItems(itemTitle: "iphone") { response in
            switch response {
                case .success(let item):
                XCTAssertEqual(item.items.count, 1)
            case .failure:
                XCTAssertFalse(true)
            }
        }
    }
}

class MockViewModel: HomeViewModelProtocol {

    var getItemCalled = false

    var itemModel: Bindable<Items> = Bindable(Items(siteID: "",
                                                    countryDefaultTimeZone: "",
                                                    query: "",
                                                    paging: Paging(),
                                                    items: [],
                                                    sort: Sort(),
                                                    availableSorts: [],
                                                    filters: [],
                                                    availableFilters: []))
    var cellsViewModel: Bindable<[ResultCellViewModel]> = Bindable([])

    func itemSelected(viewModel: ItemDetailViewModel) {

    }

    func viewDidLoad() {

    }

    func getItems(itemTitle: String) {
        getItemCalled = true
        dataSource.getItemCalled = true
    }


    var navigateToDetails: ((ItemDetailViewModel) -> ())?

    var displaySpinner: (() -> ())?

    var hideSpinner: (() -> ())?

    var presentError: (() -> ())?

    var dataSource: MockServices!

    init(dataSource: MockServices) {
        self.itemModel.value = MockItems().items
        self.cellsViewModel.value = MockItems().items.items.compactMap { ResultCellViewModel(model: $0) }
        self.dataSource = dataSource
    }
}

class MockItems {

    var items: Items!

    init() {
        items = Items(siteID: "",
                      countryDefaultTimeZone: "",
                      query: "",
                      paging: nil,
                      items: [MockItem().item],
                      sort: nil,
                      availableSorts: nil,
                      filters: nil,
                      availableFilters: nil)
    }
}

struct MockItem {
    var item: Item

    init() {

        self.item = Item()
        self.item.title = "iPhone 11 Pro"
        self.item.price = 1000
        self.item.sellerAddress?.city?.name = "Barranquilla"
        self.item.sellerAddress?.country?.name = "Atlantico"
        }
}

public final class MockWindow: UIWindow {
    public convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }

    /// Creates a mock window and sets the provided view controller as the `UIWindow.rootViewController`.
    public convenience init(rootViewController: UIViewController) {
        self.init()
        self.rootViewController = rootViewController
        makeKeyAndVisible()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.speed = 1000
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented.")
    }

}


class MockServices: MeliServices {

    var getItemCalled = false

    override func getItems(itemTitle: String, completionHandler: @escaping (Result<Items, Error>) -> Void) {
        getItemCalled = true
        completionHandler(.success(MockItems().items))
    }

}
