//
//  ProductModel.swift
//  MVVMUiKit
//
//  Created by satheesh kumar on 10/06/23.
//

import Foundation
struct ProductModel:Codable{
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
}
struct Rating:Codable{
    let rate: Float
    let count: Int
}
