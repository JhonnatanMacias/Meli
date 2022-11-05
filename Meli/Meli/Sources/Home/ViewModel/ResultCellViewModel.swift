//
//  ResultCellViewModel.swift
//  Meli
//
//  Created by Jhonnatan Macias on 2/11/22.
//

import Foundation

protocol ResultCellViewModelProtocol: AnyObject {

    var cellModel: Bindable<Item> { get }
    var isFavorited: Bindable<Bool> { get }
    var title: Bindable<String> { get }
    var image: Bindable<String> { get }

    var itemDetailViewModel: Bindable<ItemDetailViewModel> { get set}
}

class ResultCellViewModel: ResultCellViewModelProtocol {

    var cellModel: Bindable<Item> = Bindable(Item())
    var read: Bindable<Bool> = Bindable(false)
    var isFavorited: Bindable<Bool> = Bindable(false)
    var title: Bindable<String> = Bindable("")
    var image: Bindable<String> = Bindable("")

    var itemDetailViewModel: Bindable<ItemDetailViewModel> = Bindable(ItemDetailViewModel(model: Item()))

    init(model: Item) {
        cellModel.value = model
        title.value = model.title ?? ""
        image.value = model.thumbnail ?? ""
        self.itemDetailViewModel.value = ItemDetailViewModel(model: model)
    }

}
