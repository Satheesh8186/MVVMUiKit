//
//  ProductVM.swift
//  MVVMUiKit
//
//  Created by satheesh kumar on 11/06/23.
//

import Foundation
final class ProductVM{
    var products : [ProductModel] = []
    //data binding
    var eventHandler:((_ event:Event)->Void)?
    func fetchProductList(){
        self.eventHandler?(.loading)
        APIManager.shared.fetchAllGetRequest(moduleType: [ProductModel].self, apiType: EndPointItems.products) { response in
            self.eventHandler?(.stopLoading)
               switch response{
               case .success(let product):
                   self.products = product
                   self.eventHandler?(.dataLoaded)
               case .failure(let error):
                   self.eventHandler?(.error(error))
               }
        }
    }
}
extension ProductVM{
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
