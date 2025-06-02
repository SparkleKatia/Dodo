//
//  ViewController.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 27/04/2025.
//

import UIKit

final class MenuScreenVC: UIViewController {
    let productService = ProductsService()
    
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var cartButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = .boldSystemFont(ofSize: 15)
        configuration.attributedTitle = AttributedString("3 000 p", attributes: container)
        let symbolCfg = UIImage.SymbolConfiguration(pointSize: 12, weight: .bold)

        configuration.image = UIImage(systemName: "basket")?.withConfiguration(symbolCfg).withRenderingMode(.alwaysTemplate)
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = UIColor(
            red:   235.0 / 255.0,
            green: 113.0 / 255.0,
            blue:   50.0 / 255.0,
            alpha:  1.0            
        )
        configuration.baseForegroundColor = .systemBackground
        configuration.image?.withTintColor(.systemBackground)
        configuration.imagePadding = 6
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(cartButtonTap), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .orange
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryContainerHeader.self, forHeaderFooterViewReuseIdentifier: CategoryContainerHeader.reuseID)
        tableView.registerCell(BannerContainerCell.self)
        tableView.registerCell(ProductCell.self)
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        fetchProducts()
    }
    
    private func fetchProducts() {
       products = productService.fetchProducts()
    }
    
    @objc private func cartButtonTap() {
        print(#line, #function)
        
        let cartVC = CartScreenVC()

        present(cartVC, animated: true)
    }
}


extension MenuScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return products.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeuCell(indexPath) as BannerContainerCell
            return cell
            
        case 1:
            let cell = tableView.dequeuCell(indexPath) as ProductCell
            let product = products[indexPath.row]
            cell.update(product)
            return cell
            
        default: return UITableViewCell()
        }
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {

        case 1:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryContainerHeader.reuseID) as? CategoryContainerHeader
         
            return header
            
        default: return UIView()
        }
    }
}



extension MenuScreenVC {
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(cartButton)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        cartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        cartButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
    }
}
