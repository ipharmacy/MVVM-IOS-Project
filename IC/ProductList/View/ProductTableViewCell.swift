//
//  ProductTableViewCell.swift
//  IC
//
//  Created by Dhia Benhamouda on 13.12.21.
//


import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productBrand: UILabel!
    @IBOutlet weak var productCategorie: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    func configureCell(with product: Product) {

        productName.text = product.name
        productBrand.text = product.brand
        productDescription.text = product.description
        productCategorie.text = product.category
        guard let imageURL = URL(string: "https://polar-peak-71928.herokuapp.com/uploads/products/"+(product.image.first ?? "")) else {
            return
        }
        productImage.downloadImage(from: imageURL)
    }
    
}

extension UIImageView {
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
    
}
