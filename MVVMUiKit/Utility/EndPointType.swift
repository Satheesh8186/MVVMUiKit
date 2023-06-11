//
//  EndPointType.swift
//  MVVMUiKit
//
//  Created by satheesh kumar on 11/06/23.
//

import Foundation

enum HtttpMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case put = "PUT"
}

enum EndPointItems{
    case products
}

protocol EndPointType{
    var path: String { get }
    var baseURL: String{ get }
    var url: URL? { get }
    var method : HtttpMethod { get }
}

extension EndPointItems: EndPointType{
    var path: String {
        switch self {
        case .products:
           return "products"
        }
    }
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string:"\(baseURL)\(path)")
    }
    
    var method: HtttpMethod {
        switch self {
        case .products:
            return .get
        }
    }
    
    
}
