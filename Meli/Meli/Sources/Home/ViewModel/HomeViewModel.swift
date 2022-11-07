//
//  HomeViewModel.swift
//  Meli
//
//  Created by Jhonnatan Macias on 2/11/22.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {

    // MARK: - Properties

    var itemModel: Bindable<Items> { get }
    var cellsViewModel: Bindable<[ResultCellViewModel]> { get set }
    func itemSelected(viewModel: ItemDetailViewModel)
    func viewDidLoad()
    func getItems(itemTitle: String)

    // MARK: - Events

    var navigateToDetails: ((ItemDetailViewModel) -> ())? { get set }
    var displaySpinner: ( () -> ())? { get set }
    var hideSpinner: (() -> ())? { get set }
    var presentError: (() -> ())? { get set }
}

class HomeViewModel: HomeViewModelProtocol {

    var displaySpinner: (() -> ())?
    var hideSpinner: (() -> ())?
    var presentError: (() -> ())?
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
    var navigateToDetails: ((ItemDetailViewModel) -> ())?

    private var dataSoruce: MeliServices!

    init(dataSource: MeliServices) {
        self.dataSoruce = dataSource
    }

    func viewDidLoad() {}

    func getItems(itemTitle: String) {
        displaySpinner?()

        dataSoruce.getItems(itemTitle: itemTitle) { [weak self] result  in
            guard let self = self else {
                return
            }
            self.hideSpinner?()
            switch result {
            case .success(let items):
                self.setupItemModel(model: items)
            case .failure(_):
                self.presentError?()
            }
        }
    }

    private func setupItemModel(model: Items) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            self.itemModel.value = model
            self.cellsViewModel.value = model.items.compactMap{ ResultCellViewModel(model: $0 )}
        }
    }

    private func setupModel(model: Items) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            self.itemModel.value = model
            self.cellsViewModel.value = model.items.compactMap { ResultCellViewModel(model: $0) }
        }
    }

    func itemSelected(viewModel: ItemDetailViewModel) {
        navigateToDetails?(viewModel)
    }

}
