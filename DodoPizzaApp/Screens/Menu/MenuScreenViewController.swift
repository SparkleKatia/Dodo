//
//  ViewController.swift
//  DodoPizzaApp
//
//  Created by Kateryna on 27/04/2025.
//

import UIKit

// MARK: - MenuScreenViewController

final class MenuScreenViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let productService = ProductsService()
    private var products: [Product] = []
    
    // MARK: - Subviews
    
    private lazy var cartButton = CartButton()
    private lazy var tableView: UITableView = {
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

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        fetchProducts()
        setupObservers()
    }
}

// TODO: - Move it  to another file

//@frozen
public enum MenuSection: Int, CaseIterable {
    case banners
    case products
}

// MARK: - UITableViewDelegate

extension MenuScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let menuSection = MenuSection(rawValue: section) else { return UIView() }
        
        switch menuSection {
        case .products:
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryContainerHeader.reuseID) as? CategoryContainerHeader
            return header
        default: return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuSection = MenuSection(rawValue: indexPath.section) else { return }
        
        switch menuSection {
        case .products: navigateToDetailScreen()
        default: return
        }
    }
}

// MARK: - UITableViewDataSource

extension MenuScreenViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let menuSection = MenuSection(rawValue: section) else { return 0 }
            
        switch menuSection {
        case .banners: return 1
        case .products: return products.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuSection = MenuSection(rawValue: indexPath.section) else { return  UITableViewCell()}
        
        switch menuSection {
        case .banners:
            let cell = tableView.dequeuCell(indexPath) as BannerContainerCell
            return cell
        case .products:
            let cell = tableView.dequeuCell(indexPath) as ProductCell
            let product = products[indexPath.row]
            cell.update(product)
            return cell
        }
    }
}

//MARK: - Update View

extension MenuScreenViewController {
    func update(_ products: [Product]) {
        tableView.reloadData()
    }
}

//MARK: - Business Logic

extension MenuScreenViewController {
    
    private func fetchProducts() {
        productService.fetchProducts { [weak self] products in
            guard let self else { return }
            self.products = products
            self.tableView.reloadData()
        }
        
        update(products)
    }
}


//MARK: - Navigation

extension MenuScreenViewController {
    
    func navigateToDetailScreen() {
        let detailProductVC = DetailProductViewController()
        present(detailProductVC, animated: true)
    }
}

// MARK: - Layout

extension MenuScreenViewController {
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(cartButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            cartButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
}

// MARK: - Actions (Event handlers)

extension MenuScreenViewController {
    
    private func setupObservers() {
        cartButton.onCartButtonTapped = {
            let cartVC = CartScreenViewController()
            self.present(cartVC, animated: true)
        }
    }
}
