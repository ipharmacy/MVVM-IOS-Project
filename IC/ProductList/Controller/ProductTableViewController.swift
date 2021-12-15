//
//  ProductTableViewController.swift
//  IC
//
//  Created by Dhia Benhamouda on 13.12.21.
//


import UIKit

class ProductTableViewController: UITableViewController {

    var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        
        viewModel.updateView = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.errorHandling = { [weak self] error in
            self?.viewModel.showAlertView(from: self)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else {
            fatalError()
        }
        
        viewModel.configureCell(for: indexPath.row, cell: cell)
                
        return cell
    }

}
