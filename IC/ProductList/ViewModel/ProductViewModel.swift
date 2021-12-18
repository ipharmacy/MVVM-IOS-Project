//
//  ProductViewModel.swift
//  IC
//
//  Created by Dhia Benhamouda on 13.12.21.
//


import UIKit

class ProductViewModel {
    
    var products = [Product]()

    var productService = ProductService()
    
    var updateView: (() -> Void)?
    
    var errorHandling: ((Error) -> Void)?
    
    init() {
        fetchProducts()
    }
    
    func numberOfRows() -> Int {
        return products.count
    }

    func configureCell(for row: Int, cell: ProductTableViewCell) {
        cell.configureCell(with: products[row])
    }
    
    func showAlertView(from vc: UIViewController?) {
        let alertController = UIAlertController(title: "Error", message: "An Error occurs while fetching products. Please check your internet connection", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        vc?.present(alertController, animated: true)
    }
    
    private func fetchProducts() {
        
        productService.fetchProducts {[weak self] (products) in
            DispatchQueue.main.async {
                self?.products = products
                self?.updateView?()
            }
        } onError: {[weak self] (error) in
            DispatchQueue.main.async {
                self?.errorHandling?(error)
            }
        }

    }
    
}
