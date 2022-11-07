//
//  MeliServices.swift
//  Meli
//
//  Created by Jhonnatan Macias on 31/10/22.
//

import Alamofire
import Foundation


protocol MeliServicesProtocol {

    func getItems(itemTitle: String, completionHandler: @escaping(Result<Items, Error>) -> Void)

}

class MeliServices: BaseService, MeliServicesProtocol {

    struct Constants {
        static let baseURL = "https://api.mercadolibre.com/sites/MLC/search?q="
    }

    init() {
        super.init(baseURL: Constants.baseURL)
    }

    func getItems(itemTitle: String, completionHandler: @escaping(Result<Items, Error>) -> Void) {
        getCodable(URL: baseURL + itemTitle,
                   parameters: nil, responseType: Items.self) { (response: Items?, error: NSError?) in
            if let error = error {
                completionHandler(.failure(error as Error))
            } else if let response = response {
                completionHandler(.success(response))
            } else {
                let erro: Error = NSError(domain: error?.localizedDescription ?? "",
                                           code: 404,
                                           userInfo: nil) as Error
                completionHandler(.failure(erro))
            }
        }
    }
}
