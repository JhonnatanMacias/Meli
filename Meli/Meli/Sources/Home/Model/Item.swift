//
//  Item.swift
//  Meli
//
//  Created by Jhonnatan Macias on 2/11/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

// MARK: - Welcome
struct Items: Codable {
    let siteID: String
    let countryDefaultTimeZone, query: String
    let paging: Paging
    let items: [Item]
    let sort: Sort
    let availableSorts: [Sort]
    let filters: [Filter]
    let availableFilters: [AvailableFilter]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, sort
        case availableSorts = "available_sorts"
        case filters
        case items = "results"
        case availableFilters = "available_filters"
    }
}

// MARK: - AvailableFilter
struct AvailableFilter: Codable {
    let id, name, type: String?
    let values: [AvailableFilterValue]?
}

// MARK: - AvailableFilterValue
struct AvailableFilterValue: Codable {
    let id, name: String?
    let results: Int?
}

// MARK: - Sort
struct Sort: Codable {
    var id: String?
    var name: String?

    init() {
        id = ""
        name = ""
    }
}

// MARK: - Filter
struct Filter: Codable {
    let id, name, type: String?
    let values: [FilterValue]?
}

// MARK: - FilterValue
struct FilterValue: Codable {
    let id, name: String?
    let pathFromRoot: [Sort]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
}

// MARK: - Paging
struct Paging: Codable {
    var total, primaryResults, offset, limit: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }

    init() {
        self.total = 0
        self.primaryResults = 0
        self.offset = 0
        self.limit = 0
    }
}

// MARK: - Result
struct Item: Codable {
    var id: String?
    var siteID: String?
    var title: String?
    var seller: Seller?
    var price: Double?
    var prices: Prices?
    var currencyID: String?
    var availableQuantity, soldQuantity: Int?
    var buyingMode: String?
    var listingTypeID: String?
    var stopTime: String?
    var condition: String?
    var permalink: String?
    var thumbnail: String?
    var thumbnailID: String?
    var acceptsMercadopago: Bool?
    var installments: Installments?
    var address: Address?
    var shipping: Shipping?
    var sellerAddress: SellerAddress?
    var attributes: [Attribute]?
    var categoryID: String?
    var domainID: String?
    var catalogProductID: String?
    var tags: [String]?
    var orderBackend: Int?
    var useThumbnailID: Bool?
    var differentialPricing: DifferentialPricing?

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, seller, price, prices
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case stopTime = "stop_time"
        case condition, permalink, thumbnail
        case thumbnailID = "thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case installments, address, shipping
        case sellerAddress = "seller_address"
        case attributes
        case categoryID = "category_id"
        case domainID = "domain_id"
        case catalogProductID = "catalog_product_id"
        case tags
        case orderBackend = "order_backend"
        case useThumbnailID = "use_thumbnail_id"
        case differentialPricing = "differential_pricing"
    }

    init() {}
}

// MARK: - Address
struct Address: Codable {
    let stateID: String?
    let stateName: String?
    let cityID: String?
    let cityName: String?

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
        case cityID = "city_id"
        case cityName = "city_name"
    }
}

// MARK: - Attribute
struct Attribute: Codable {
    let valueID: String?
    let valueName: String?
    let attributeGroupID: String?
    let source: Int?
    let id: String?
    let name: String?
    let values: [AttributeValue]?
    let attributeGroupName: String?
    let valueType: String?

    enum CodingKeys: String, CodingKey {
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
        case source, id, name, values
        case attributeGroupName = "attribute_group_name"
        case valueType = "value_type"
    }
}

// MARK: - AttributeValue
struct AttributeValue: Codable {
    let id: String?
    let name: String?
    let source: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case source
    }
}

// MARK: - DifferentialPricing
struct DifferentialPricing: Codable {
    let id: Int?
}

// MARK: - Installments
struct Installments: Codable {
    let quantity: Int?
    let amount, rate: Double?
    let currencyID: String?

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}

// MARK: - Prices
struct Prices: Codable {
    let id: String?
    let prices: [Price]?
    let presentation: Presentation?
    let referencePrices: [Price]?

    enum CodingKeys: String, CodingKey {
        case id, prices, presentation
        case referencePrices = "reference_prices"
    }
}

// MARK: - Presentation
struct Presentation: Codable {
    let displayCurrency: String?

    enum CodingKeys: String, CodingKey {
        case displayCurrency = "display_currency"
    }
}

// MARK: - Price
struct Price: Codable {
    let id: String?
    let type: String?
    let amount: Double?
    let regularAmount: Double?
    let currencyID: String?
    let lastUpdated: String?
    let conditions: Conditions?
    let exchangeRateContext: String?
    let metadata: Metadata?

    enum CodingKeys: String, CodingKey {
        case id, type, amount
        case regularAmount = "regular_amount"
        case currencyID = "currency_id"
        case lastUpdated = "last_updated"
        case conditions
        case exchangeRateContext = "exchange_rate_context"
        case metadata
    }
}

// MARK: - Conditions
struct Conditions: Codable {
    let contextRestrictions: [String]?
    let startTime, endTime: String?
    let eligible: Bool

    enum CodingKeys: String, CodingKey {
        case contextRestrictions = "context_restrictions"
        case startTime = "start_time"
        case endTime = "end_time"
        case eligible
    }
}

// MARK: - Metadata
struct Metadata: Codable {
    let promotionID, promotionType: String?

    enum CodingKeys: String, CodingKey {
        case promotionID = "promotion_id"
        case promotionType = "promotion_type"
    }
}

// MARK: - Seller
struct Seller: Codable {
    let id: Int?
    let permalink: String?
    let registrationDate: String?
    let carDealer, realEstateAgency: Bool?
    let tags: [String]?
    let sellerReputation: SellerReputation?

    enum CodingKeys: String, CodingKey {
        case id, permalink
        case registrationDate = "registration_date"
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
        case tags
        case sellerReputation = "seller_reputation"
    }
}

// MARK: - SellerReputation
struct SellerReputation: Codable {
    let levelID: String?
    let metrics: Metrics?
    let transactions: Transactions?
    let realLevel, protectionEndDate: String?

    enum CodingKeys: String, CodingKey {
        case levelID = "level_id"
        case metrics, transactions
        case realLevel = "real_level"
        case protectionEndDate = "protection_end_date"
    }
}

// MARK: - Metrics
struct Metrics: Codable {
    let cancellations, claims, delayedHandlingTime: Cancellations?
    let sales: Sales?

    enum CodingKeys: String, CodingKey {
        case cancellations, claims
        case delayedHandlingTime = "delayed_handling_time"
        case sales
    }
}

// MARK: - Cancellations
struct Cancellations: Codable {
    let period: String?
    let rate: Double?
    let value: Int?
    let excluded: Excluded?
}

// MARK: - Excluded
struct Excluded: Codable {
    let realValue: Int?
    let realRate: Double?

    enum CodingKeys: String, CodingKey {
        case realValue = "real_value"
        case realRate = "real_rate"
    }
}

// MARK: - Sales
struct Sales: Codable {
    let period: String?
    let completed: Int?
}

// MARK: - Transactions
struct Transactions: Codable {
    let canceled: Int?
    let period: String?
    let total: Double?
    let ratings: Ratings?
    let completed: Int?
}

enum TransactionsPeriod: String, Codable {
    case historic = "historic"
}

// MARK: - Ratings
struct Ratings: Codable {
    let negative, neutral, positive: Double?
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    let id, comment, addressLine, zipCode: String?
    let country, state, city: Sort?
    let latitude, longitude: String?

    enum CodingKeys: String, CodingKey {
        case id, comment
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case country, state, city, latitude, longitude
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool?
    let mode: String?
    let logisticType: String?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}
