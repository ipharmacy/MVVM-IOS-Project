//
//  ProductService.swift
//  IC
//
//  Created by Dhia Benhamouda on 13.12.21.
//


import Foundation

enum NetworkError: Error {
    case invalidResponse
    case noData
}

import Foundation

final class ProductService: ProductServiceProtocol {
    
    private var baseURL: URL {
        return URL(string: "https://polar-peak-71928.herokuapp.com/api/products/")!
    }
    
    func fetchProducts(onSuccess: @escaping ([Product]) -> Void, onError: @escaping (Error) -> Void) {
        makeRequest(with: baseURL, onSuccess: onSuccess, onError: onError)
    }
    
    private func makeRequest(with url: URL, onSuccess: @escaping ([Product]) -> Void, onError: @escaping (Error) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in

            if let error = error {
                onError(error)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            guard let data = data else {
                onError(NetworkError.invalidResponse)
                return
            }
                        
            do {
                let products = try decoder.decode([Product].self, from: data)
                
                guard products.count > 0 else {
                    onError(NetworkError.noData)
                    return
                }
                onSuccess(products)
            
            } catch let error {
                print("error: ", error)
            }

        }.resume()
        
    }
}
