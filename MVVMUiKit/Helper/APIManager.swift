//
//  APIManager.swift
//  MVVMUiKit
//
//  Created by satheesh kumar on 10/06/23.
//
import UIKit
enum DataError:Error{
    case invalidResponse
    case invalidData
    case invalidUrl
    case inavildDecoder
    case network(_ error:Error?)
}
// you can define any name for give type and use it example typealias = stringObj use as  var name : stringObj?
typealias handler = (Result<[ProductModel],DataError>) -> Void


//final will stop from inheritance 
final class APIManager {
    static let shared = APIManager()
       private init() {}
    func fetchProductsList(completion:@escaping handler){
        guard let url = URL(string: Constant.API.productURL) else{
            
            completion(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,error == nil  else{
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,200 ... 200 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let products = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(products))
            }catch{
                completion(.failure(.network(error)))
            }
        }.resume()
        
    }
    
}
