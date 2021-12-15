//
//  ProductServiceProtocol.swift
//  IC
//
//  Created by Dhia Benhamouda on 13.12.21.
//


import Foundation

protocol ProductServiceProtocol {
    func fetchProducts(onSuccess: @escaping ([Product]) -> Void, onError: @escaping (Error) -> Void)
}
