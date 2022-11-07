//
//  ItemDetailViewModel.swift
//  Meli
//
//  Created by Jhonnatan Macias on 2/11/22.
//

import Foundation


protocol ItemDetailViewModelProtocol: AnyObject {

    // MARK: - Properties

    var model: Bindable<Item> { get set }
    var title: Bindable<String> { get set }
    var image: Bindable<String> { get set }
    var soldQuantity: Bindable<Int> { get set }
    var price: Bindable<String> { get set }
    var bulletedModel: Bindable<BulletedCopyBlockModel> { get set }
    var quantity: Bindable<Int> { get set }
    var shippingModel: Bindable<TagViewModel> { get set }
    var storePickupModel: Bindable<TagViewModel> { get set }
    var sellerInfo: Bindable<String> { get set }


    // MARK: - Events

    var startedItemDetail: ((Item) -> ())? { get set}
}

class ItemDetailViewModel: ItemDetailViewModelProtocol {

    var startedItemDetail: ((Item) -> ())?

    var model: Bindable<Item> = Bindable(Item())
    var title: Bindable<String> = Bindable("")
    var image: Bindable<String> = Bindable("")
    var soldQuantity: Bindable<Int> = Bindable(0)
    var price: Bindable<String> = Bindable("")
    var quantity: Bindable<Int> = Bindable(0)
    var bulletedModel: Bindable<BulletedCopyBlockModel> = Bindable(BulletedCopyBlockModel(cells: []))
    var shippingModel: Bindable<TagViewModel> = Bindable(TagViewModel(tagTitle: "", isAvailable: false))
    var storePickupModel: Bindable<TagViewModel> = Bindable(TagViewModel(tagTitle: "", isAvailable: false))
    var sellerInfo: Bindable<String> = Bindable("")

    init(model: Item) {
        self.model.value = model
        self.title.value = model.title ?? ""
        currencyFormarter(price: model.price ?? 0.0)
        self.image.value = model.thumbnail ?? ""

        if let attributes = model.attributes {
            let cellModel = attributes.compactMap{ BulletedCopyBlockCellModel(bulletTitle: $0.name,
                                                                          bulletParagraph: $0.valueName) }
            bulletedModel.value = BulletedCopyBlockModel(cells: cellModel)
        }

        quantity.value = model.availableQuantity ?? 0
        soldQuantity.value = model.soldQuantity ?? 0

        let freeShipping =  model.shipping?.freeShipping ?? false
        let shippingTitle = freeShipping ? "Envio Gratis" : "Envio Con Costo"
        shippingModel.value = TagViewModel(tagTitle: shippingTitle, isAvailable: freeShipping)

        let storePickUp = model.shipping?.storePickUp ?? false
        storePickupModel.value = TagViewModel(tagTitle: "Recoger en Tienda", isAvailable: storePickUp)

        let countryName = model.sellerAddress?.country?.name ?? ""
        let cityName = model.sellerAddress?.city?.name ?? ""

        sellerInfo.value = "Ubicación\n\(countryName) - \(cityName)"
    }

    func currencyFormarter(price: Double) {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: price as NSNumber) {
            self.price.value = "\(formattedTipAmount)"
        }
    }
}
